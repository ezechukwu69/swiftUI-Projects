//
//  SelectPdfView.swift
//  pdfViewer
//
//  Created by Apple on 01/06/2021.
//

import SwiftUI

struct SelectPdfView: View {
    var body: some View {
        VStack(alignment: .center) {
            ZStack(alignment: .center) {
                Image(systemName: "doc.fill.badge.plus")
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
            }
            .frame(width: 100, height: 100, alignment: .center)
            .padding(.top, 70)
            .padding(.top, 50)

            
            Text("Select a pdf file to view")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(Color(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)))
                .padding(.top, 70)
                .padding(.bottom, 70)
                .padding([.leading, .trailing], 50)

        }
        .background(Color.offwhite)
        .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
        
    }
}

struct SelectPdfView_Previews: PreviewProvider {
    static var previews: some View {
        SelectPdfView()
            .previewLayout(.sizeThatFits)
    }
}

extension Color {
    static let offwhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
}
