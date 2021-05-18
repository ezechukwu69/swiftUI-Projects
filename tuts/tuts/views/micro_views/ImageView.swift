//
//  ImageView.swift
//  tuts
//
//  Created by Apple on 07/05/2021.
//

import SwiftUI
import Combine




struct ImageView: View {
    
    @StateObject var vm: ImageViewModel
    
    init(url: String) {
        _vm = StateObject(wrappedValue: ImageViewModel(url: url))
    }
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
            }
        }
        
    }
}
