//
//  SettingsView.swift
//  tuts
//
//  Created by Apple on 18/05/2021.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("unit") var unit: String = "Metric"
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Configure App standards")) {
                    Picker(selection: $unit, label: Text("Unit")) {
                        Text("Metric").tag("Metric")
                        Text("Imperial").tag("Imperial")
                        Text("Standard").tag("Standard")
                    }
                }
            }
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
