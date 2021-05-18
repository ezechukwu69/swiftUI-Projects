//
//  GradientCard.swift
//  tuts
//
//  Created by Apple on 07/05/2021.
//

import SwiftUI

struct GradientCard: View {
    
    @State private var hovered: Bool = false
    @State private var unit: String = SettingsViewModel.shared.$unit.wrappedValue
    
    let weatherDescription: String
    let degree: String
    let date: String
    let image: String
    
    var gradient: some View {
        LinearGradient(gradient: Gradient(colors:
                                            [Color(#colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1)),Color(#colorLiteral(red: 0.5810584426, green: 0.1285524964, blue: 0.5745313764, alpha: 1)) ,Color.orange]
        ), startPoint: .topTrailing, endPoint: .bottomLeading)
    }
    
    var itemDescription: some View {
        VStack(alignment: .center, spacing: 0.0) {
            Text("\(weatherDescription)")
                .font(.title2)
                .padding(.top, 50)
            Text("\(degree)\(unit == "Metric" ? "°C" : unit == "Imperial" ? "°F" : "K")")
                .font(.system(size: 180, weight: .bold, design: .rounded))
                .minimumScaleFactor(0.0001)
                .lineLimit(1)
                .padding(.horizontal, 50)
                .padding(.bottom, 70)
        }
        .foregroundColor(.white)
    }
    
    var mainDescription: some View {
        ZStack {
            gradient
            itemDescription
        }
        .frame(width: 330, height: 370)
        .cornerRadius(100)
    }
    
    var datedescription: some View {
        Text("\(date)")
            .font(.system(size: 18, weight: .medium, design: .rounded))
            .padding()
            .background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 0.9455907961)))
            .cornerRadius(30)
            .offset(y: -180.0)
            .shadow(color: .gray, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
    }
    
    var imageView: some View {
        ImageView(url: image)
            .scaledToFill()
            .frame(width: 300, height: 300)
            .offset(y: 160.0)
        }
    
    var body: some View {
        ZStack(alignment: .center) {
            mainDescription
            datedescription
            imageView
        }
        .padding(.top)
    }
}

struct GradientCard_Previews: PreviewProvider {
    static var previews: some View {
        GradientCard(weatherDescription: "Raining",
                     degree: "25",
                     date: "Monday, 12 June",
                     image: "https://openweathermap.org/img/wn/10n@2x.png")
    }
}
