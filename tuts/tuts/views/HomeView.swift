//
//  HomeView.swift
//  tuts
//
//  Created by Apple on 07/05/2021.
//

import SwiftUI

struct TestData {
    let weatherDescription: String
    let degree: String
    let date: String
    let image: UIImage
    
    static var list: [TestData] {
        return [
            TestData(weatherDescription: "Stormy", degree: "45", date: "Monday, 12 June", image: UIImage(systemName: "cloud.heavyrain.fill")!),
            TestData(weatherDescription: "Stormy", degree: "46", date: "Monday, 12 June", image: UIImage(systemName: "cloud.heavyrain.fill")!),

            TestData(weatherDescription: "Stormy", degree: "47", date: "Monday, 12 June", image: UIImage(systemName: "cloud.heavyrain.fill")!),

            TestData(weatherDescription: "Stormy", degree: "48", date: "Monday, 12 June", image: UIImage(systemName: "cloud.heavyrain.fill")!),

            TestData(weatherDescription: "Stormy", degree: "49", date: "Monday, 12 June", image: UIImage(systemName: "cloud.heavyrain.fill")!),

            TestData(weatherDescription: "Stormy", degree: "50", date: "Monday, 12 June", image: UIImage(systemName: "cloud.heavyrain.fill")!),

        ]
    }
}

struct HomeView: View {
    @EnvironmentObject var vm: HomeViewModel
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea(.all)
                VStack {
                    if let data = vm.weatherData {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(data.daily, id: \Daily.id) { weather in
                                    GradientCard(
                                        weatherDescription: weather.weather.first?.main.rawValue ?? "",
                                        degree: "\(Int(weather.feelsLike.day))",
                                        date: dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weather.dt))),
                                        image: "https://openweathermap.org/img/wn/\(weather.weather.first?.icon ?? "")@2x.png")
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 70)
                                }
                            }
                            .padding(.horizontal, 8)
                        }
                        .padding(.top)
                        Spacer()
                    }
                }
            }
            .navigationBarTitle("Chicago")
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


