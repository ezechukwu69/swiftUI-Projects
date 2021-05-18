//
//  HomeView.swift
//  tuts
//
//  Created by Apple on 07/05/2021.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var vm: HomeViewModel
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    
    private var timeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }
    
    private var cardList: some View {
        VStack {
            if let data = vm.weatherData {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(data.daily, id: \Daily.id) { weather in
                            GeometryReader { geo in
                                GradientCard(
                                    weatherDescription: weather.weather.first?.main.rawValue ?? "",
                                    degree: "\(Int(weather.feelsLike.day))",
                                    date: dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weather.dt))),
                                    image: "https://openweathermap.org/img/wn/\(weather.weather.first?.icon ?? "")@2x.png")
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 40)
                                    .rotation3DEffect(
                                        .degrees(-Double(geo.frame(in: .global).minX / 8)),
                                        axis: (x: 1.0, y: 1, z: 0.0)
                                    )
                                    .onTapGesture {
                                        vm.currentWeatherSelected = weather
                                    }
                            }
                            .frame(width: 330, height: 700)
                        }
                    }
                    .padding(.horizontal, 8)
                }
                Spacer()
            }
        }
    }
    
    private var bottomCardTitle: some View {
        HStack {
            Text("7 days forcast")
                .font(.title2)
                .padding()
            Spacer()
            HStack {
                Text("View")
                Image(systemName: "arrowshape.bounce.right.fill")
            }
            .foregroundColor(.black)
            .padding()
        }
    }
    
    private func bottomCardItem(_ name: String, _ degree: String,_ systemName: String) -> some View {
        VStack(alignment: .center) {
            Image(systemName: systemName)
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.purple)
                .padding(.bottom, 6)
            Text("\(degree)")
                .font(.custom("ABeezee-Regular", size: 18, relativeTo: .headline))
                .fontWeight(.heavy)
                .padding(.bottom, 1)
            Text("\(name)")
                .font(.custom("ABeezee-Regular", size: 14, relativeTo: .headline))
                .foregroundColor(.gray)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)

        }
    }
    
    private var dateTimes: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .bottom) {
                    if let data = vm.weatherData {
                        ForEach(data.hourly, id: \Current.id) { _data in
                            VStack {
                                Text("\(Int(_data.feelsLike.rounded(.toNearestOrAwayFromZero)))°")
                                ImageView(url: "https://openweathermap.org/img/wn/\(_data.weather.first?.icon ?? "")@2x.png")
                                    .frame(width: 40, height: 40)
                                Text("\(timeFormatter.string(from: Date.init(timeIntervalSince1970: TimeInterval(_data.dt))))")
                            }
                            .padding()
                            .background(LinearGradient(gradient: Gradient(colors:
                                                                            [Color(#colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1)),Color(#colorLiteral(red: 0.5810584426, green: 0.1285524964, blue: 0.5745313764, alpha: 1)) ,Color.orange]
                            ), startPoint: .topTrailing, endPoint: .bottomLeading))
                            .cornerRadius(20)
                            .padding(.horizontal, 12)
                            .padding(.bottom, 15)
                            .foregroundColor(Color.white)
                        }
                    }
                }
            }
        }
    }
    
    private var bottomCard: some View {
        VStack {
            Spacer()
            VStack {
                Spacer()
//                bottomCardTitle
//                    .padding(.bottom, 8)
                dateTimes
            }.frame(maxWidth: .infinity)
            .frame(height: 240)
            .background(Color(#colorLiteral(red: 0.974973079, green: 0.9689972778, blue: 1, alpha: 1)))
            .padding(.top)
        }
    }
    
    private var detailsCard: some View {
        VStack {
            Spacer()
            HStack(alignment: .center) {
                bottomCardItem("Humidity","\(vm.currentWeatherSelected!.humidity)%","thermometer.sun")
                Spacer()
                bottomCardItem("Wind","\(vm.currentWeatherSelected!.windSpeed)m/s","wind")
                Spacer()
                bottomCardItem("Pressure","\(vm.currentWeatherSelected!.pressure)hPa","sun.haze.fill")
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 30)
            .padding(.horizontal, 20)
            .background(Color.white)
            .cornerRadius(16)
            .offset(x: 0, y: -130)
            .padding(.horizontal, 19)
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [
                    Color("BackgroundColor1"),Color("BackgrouncColor2")
                ]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea(.all)
                    
                cardList
                if let _ = vm.currentWeatherSelected {
                        ZStack {
                            bottomCard
                                .ignoresSafeArea()
                            detailsCard
                        }
                } else {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
            }
            .navigationBarTitle(Text(vm.appTitle))
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: NavigationLink (
                                    destination: SettingsView(),
                                    label: {
                                        Image(systemName: "gear")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                    }))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(HomeViewModel())
    }
}


