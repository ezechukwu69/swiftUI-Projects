//
//  Extensions.swift
//  pdfViewer
//
//  Created by Apple on 01/06/2021.
//

import SwiftUI

extension View {
    func customizeBackgroundColor(backGroundColor: UIColor, textColor: UIColor) -> some View {
        self.modifier(NavBarModifier(backGroundColor: backGroundColor, textColor: textColor))
    }
}
