//
//  SettingsViewModel.swift
//  tuts
//
//  Created by Apple on 18/05/2021.
//

import Foundation
import Combine
import SwiftUI


class SettingsViewModel: ObservableObject {
    static let shared = SettingsViewModel()
    
    @AppStorage("unit") var unit: String = "Metric" {
        willSet { objectWillChange.send() }
    }
}
