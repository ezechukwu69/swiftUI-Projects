//
//  LocationManaager.swift
//  tuts
//
//  Created by Apple on 18/05/2021.
//

import Foundation
import CoreLocation


class LocationManager: NSObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()


    init(completion: (CLLocationCoordinate2D) -> ()) {
        super.init()
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print("called")
    }
    
}
