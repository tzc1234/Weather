//
//  LocationManager.swift
//  Weather
//
//  Created by Tsz-Lung on 31/05/2022.
//

import CoreLocation
import Combine

final class LocationManager: NSObject {
    static let shared = LocationManager()
    
    private var clLocationManager: CLLocationManager?
    let coordinatePublisher: PassthroughSubject<CLLocationCoordinate2D?, Never>
    
    private override init() {
        coordinatePublisher = PassthroughSubject<CLLocationCoordinate2D?, Never>()
    }
}

// MARK: functions
extension LocationManager {
    func checkIfLocationServiceEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            clLocationManager = CLLocationManager()
            clLocationManager?.delegate = self
        } else {
            coordinatePublisher.send(nil)
        }
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = clLocationManager else { return }
        
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            coordinatePublisher.send(nil)
        case .restricted:
            coordinatePublisher.send(nil)
        case .denied:
            coordinatePublisher.send(nil)
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.requestLocation()
        @unknown default:
            break
        }
    }
}

// MARK: CLLocationManagerDelegate
extension LocationManager: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        coordinatePublisher.send(locations.last!.coordinate)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
