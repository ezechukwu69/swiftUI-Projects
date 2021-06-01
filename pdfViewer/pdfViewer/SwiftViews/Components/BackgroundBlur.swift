//
//  BackgroundBlur.swift
//  pdfViewer
//
//  Created by Apple on 01/06/2021.
//

import SwiftUI

struct BackgroundBlurView: View {
    var body: some View {
        ZStack {
            Color.offwhite
        }.ignoresSafeArea()
    }
}

struct BackgroundBlur_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundBlurView()
    }
}
