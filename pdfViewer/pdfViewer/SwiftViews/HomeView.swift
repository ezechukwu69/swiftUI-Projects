//
//  HomeView.swift
//  pdfViewer
//
//  Created by Apple on 01/06/2021.
//

import SwiftUI

struct HomeView: View {
    @State private var showDocumentPicker = false
    @State private var url: URL?
    @State var animation: Bool = false

    
    var body: some View {
        NavigationView {
            ZStack {
                if let url = url {
                    NavigationLink(
                        destination: PDFViewer(url: url),
                        tag: url,
                        selection: $url,
                        label: {EmptyView()})
                }
                BackgroundBlurView()
                SelectPdfView()
                    .frame(width: 500, height: 500)
                    .scaleEffect(animation ? 1.1 : 0.9)
                    .animation(.easeInOut(duration: 3).repeatForever(autoreverses: true))
                    .sheet(isPresented: $showDocumentPicker) {
                        UIDocumentPicker(url: $url)
                    }
                    .onAppear {
                        animation.toggle()
                    }
                    
            }
            .navigationTitle("Pdf Viewer")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: HStack {
                Image(systemName: "doc.fill.badge.plus")
                    .resizable()
                    .frame(width: 20, height: 20, alignment: .center)
                    .foregroundColor(.blue)
                    .onTapGesture {
                        showDocumentPicker.toggle()
                    }
            })
            .customizeBackgroundColor(backGroundColor: UIColor(Color.offwhite), textColor: UIColor(Color.black.opacity(0.8)))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

extension URL: Identifiable {
    public var id: String {
        return self.absoluteString
    }
}
