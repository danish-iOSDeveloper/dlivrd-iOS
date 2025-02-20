//
//  LocationManager.swift
//  sidebartesting
//
//  Created by IBTIDAH-IOS on 20/02/2025.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    static let shared = LocationManager()  // Singleton instance
    
    private var locationManager = CLLocationManager()
    
    @Published var lastLocation: CLLocation?

    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        DispatchQueue.main.async {
            self.lastLocation = location
        }
    }
}
