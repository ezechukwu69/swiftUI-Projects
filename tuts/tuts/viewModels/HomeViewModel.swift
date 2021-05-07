//
//  HomeViewModel.swift
//  tuts
//
//  Created by Apple on 07/05/2021.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var weatherData: WeatherResponse? = nil
    
    var cancellable: Set<AnyCancellable> = Set()
    
    init() {
        NetworkUtil.getData(urlString: "https://api.openweathermap.org/data/2.5/onecall?lat=10.0000&lon=100.000&appid=806d00dde3ec9558678e665b189f60de&units=metric")
            .receive(on: DispatchQueue.main)
            .sink { (completer) in
                switch completer {
                case .failure(let err): print(err.localizedDescription)
                case .finished: print("Data gotten")
                }
            } receiveValue: {[weak self] (data: WeatherResponse) in
                self?.weatherData = data
            }.store(in: &cancellable)
    }
    
}

