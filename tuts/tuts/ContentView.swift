//
//  ContentView.swift
//  tuts
//
//  Created by Apple on 07/05/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var offset: CGFloat = 0
    @State var showSheet = false
    
    var body: some View {
        HomeView()
            .environmentObject(HomeViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
