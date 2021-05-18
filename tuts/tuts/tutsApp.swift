//
//  tutsApp.swift
//  tuts
//
//  Created by Apple on 07/05/2021.
//

import SwiftUI

@main
struct tutsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(HomeViewModel())
        }
    }
}
