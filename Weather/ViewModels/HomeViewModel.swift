//
//  HomeViewModel.swift
//  Weather
//
//  Created by Tsz-Lung on 28/05/2022.
//

import Foundation
import Combine

@MainActor
final class HomeViewModel: ObservableObject {
    @Published private(set) var geoPosition: GeoPosition?
    @Published private(set) var currentConditions: [CurrentCondition] = []
    @Published private(set) var hourlyForecasts: [HourlyForecast] = []
    
    private var subscriptions = Set<AnyCancellable>()
    
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
        subscriptLocationPermission()
    }
}

// MARK: computed variables
extension HomeViewModel {
    var currentCondition: CurrentCondition? {
        currentConditions.first
    }
}

// MARK: functions
extension HomeViewModel {
    private func subscriptLocationPermission() {
        LocationManager.shared.coordinatePublisher
            .sink { [weak self] coordinate in
                guard let self = self else { return }
                
                if let coordinate = coordinate {
                    Task {
                        await self.fetchWeathData(lat: coordinate.latitude, lon: coordinate.longitude)
                    }
                }
            }
            .store(in: &subscriptions)
    }
    
    private func fetchWeathData(lat: Double, lon: Double) async {
        do {
            (geoPosition, currentConditions, hourlyForecasts) = try await networkManager.fetchWeatherData(lat: lat, lon: lon)
//            print(hourlyForecasts)
        } catch {
            let errMsg = (error as? NetworkError)?.errorMsg ?? error.localizedDescription
            print(errMsg)
        }
    }
    
    func checkIfLocationServiceEnabled() {
        LocationManager.shared.checkIfLocationServiceEnabled()
    }
}
