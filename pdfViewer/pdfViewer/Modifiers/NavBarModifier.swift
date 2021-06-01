//
//  NavBarModifier.swift
//  pdfViewer
//
//  Created by Apple on 01/06/2021.
//

import SwiftUI

struct NavBarModifier: ViewModifier {
    var backGroundColor: UIColor
    var textColor: UIColor
    
    init(backGroundColor: UIColor, textColor: UIColor) {
        self.backGroundColor = backGroundColor
        self.textColor = textColor
        let barAppearance = UINavigationBarAppearance()
        barAppearance.configureWithTransparentBackground()
        barAppearance.backgroundColor = .clear
        barAppearance.titleTextAttributes = [.foregroundColor: textColor]
        barAppearance.backButtonAppearance = UIBarButtonItemAppearance(style: .done)
        UINavigationBar.appearance().tintColor = textColor
        UINavigationBar.appearance().standardAppearance = barAppearance
        UINavigationBar.appearance().compactAppearance = barAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = barAppearance

    }
    
    func body(content: Content) -> some View {
        ZStack{
               content
                VStack {
                  GeometryReader { geometry in
                     Color(self.backGroundColor)
                        .frame(height: geometry.safeAreaInsets.top)
                        .frame(maxWidth: .infinity)
                        .edgesIgnoringSafeArea(.top)
                      Spacer()
                  }
                }
             }
    }
    
}
