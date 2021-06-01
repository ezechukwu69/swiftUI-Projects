//
//  UiDocumentPicker.swift
//  pdfViewer
//
//  Created by Apple on 01/06/2021.
//

import SwiftUI
import UIKit

struct UIDocumentPicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    @Binding var url: URL?
    
    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        let file = UIDocumentPickerViewController(forOpeningContentTypes: [.pdf])
        file.delegate = context.coordinator
        return file
    }
    
    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {
        print("Update")
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIDocumentPickerDelegate {
        var parent: UIDocumentPicker
        
        init(_ parent: UIDocumentPicker) {
            self.parent = parent
        }
        
        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            parent.url = urls.first
        }
        
    }
    
}

