//
//  HomeViewModel.swift
//  tuts
//
//  Created by Apple on 07/05/2021.
//

import Foundation
import Combine
import CoreLocation

class HomeViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    @Published var weatherData: WeatherResponse? = nil
    @Published var currentWeatherSelected: Daily? = nil
    @Published var appTitle = ""
    
    var cancellable: Set<AnyCancellable> = Set()
    
    override init() {
        super.init()
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        SettingsViewModel.shared.objectWillChange.sink {[weak self] in
            self?.getLocation(unit: SettingsViewModel.shared.unit)
        }.store(in: &cancellable)
    }
    
    func getLocation(unit: String) {
        guard let latitude = manager.location?.coordinate.latitude, let longitude = manager.location?.coordinate.latitude else {
            print("No data from location")
            return
        }
        NetworkUtil.getData(urlString: "https://api.openweathermap.org/data/2.5/onecall?lat=\(latitude)&lon=\(longitude.magnitude)&appid=806d00dde3ec9558678e665b189f60de&units=\(unit)")
            .receive(on: DispatchQueue.main)
            .sink { (completer) in
                switch completer {
                case .failure(let err): print("Completer error: \(err)")
                case .finished: print("\(#function) - \(#line) - \(unit)")
                }
            } receiveValue: {[weak self] (data: WeatherResponse) in
                self?.currentWeatherSelected = data.daily.first
                self?.weatherData = data
                self?.appTitle = String(data.timezone.split(separator: "/")[1])
                print(self?.appTitle ?? "")
            }.store(in: &cancellable)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways: self.getLocation(unit: SettingsViewModel.shared.unit.lowercased())
        case .authorizedWhenInUse: self.getLocation(unit: SettingsViewModel.shared.unit.lowercased())
        default: print("Not gotten")
        }
    }
    
}

