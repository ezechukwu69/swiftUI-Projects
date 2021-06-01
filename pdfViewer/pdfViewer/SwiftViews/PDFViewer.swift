//
//  PDFView.swift
//  pdfViewer
//
//  Created by Apple on 01/06/2021.
//

import SwiftUI

struct PDFViewer: View {
    let url: URL
    var body: some View {
        ZStack {
            PDFOpenedView(url: url)
                .frame(width: UIScreen.main.nativeBounds.maxX, height: UIScreen.main.nativeBounds.maxY, alignment: .center)
                .navigationTitle("Document")
        }
        .ignoresSafeArea(.all)
    }
}


