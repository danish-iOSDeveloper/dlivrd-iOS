//
//  AppDelegate.swift
//  sidebartesting
//
//  Created by IBTIDAH-IOS on 20/02/2025.
//

import Foundation
import UIKit
import CoreLocation
import Firebase

class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {
    
    var window: UIWindow?
    var locationManager: CLLocationManager?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? ) -> Bool {
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()  // Request permission
        locationManager?.allowsBackgroundLocationUpdates = true
        locationManager?.pausesLocationUpdatesAutomatically = false
        
        if CLLocationManager.significantLocationChangeMonitoringAvailable() {
            locationManager?.startMonitoringSignificantLocationChanges()
            print("Started monitoring significant location changes")
        }
        FirebaseApp.configure()
        return true
    }
//    func applicationWillTerminate(_ application: UIApplication) {
//        print("Application terminated")
//        if CLLocationManager.significantLocationChangeMonitoringAvailable() {
//            locationManager?.startMonitoringSignificantLocationChanges()
//            print("Application started Monitoring SLC")
//        }
//    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        print("Updated Location: \(location.coordinate.latitude), \(location.coordinate.longitude)")
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location update failed: \(error.localizedDescription)")
    }
}

