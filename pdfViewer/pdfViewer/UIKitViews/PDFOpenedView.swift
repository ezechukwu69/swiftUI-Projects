//
//  PDFView.swift
//  pdfViewer
//
//  Created by Apple on 01/06/2021.
//

import SwiftUI
import PDFKit

class PDFDelegate: NSObject, PDFDocumentDelegate {
    
}

struct PDFOpenedView: UIViewRepresentable {
    var url: URL
    
    func makeUIView(context: Context) -> PDFView {
        let view = PDFView()
        view.document = PDFDocument(url: url)
        view.autoScales = false
        view.displayBox = .cropBox
        view.displayMode = .singlePageContinuous
        view.displayDirection = .horizontal
        return view
    }
    
    func updateUIView(_ uiView: PDFView, context: Context) {
        print("\(#line)")
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
        
    class Coordinator: NSObject, PDFViewDelegate {
        var parent: PDFOpenedView
        
        init(_ parent: PDFOpenedView) {
            self.parent = parent
        }
        
    }
}

