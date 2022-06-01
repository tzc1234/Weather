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
        subscriptLocationCoordinatePublisher()
    }
}

// MARK: computed variables
extension HomeViewModel {
    var currentCondition: CurrentCondition? {
        currentConditions.first
    }
    
    var hiLoTemps: (hi: Int?, lo: Int?) {
        var temps: Set<Double> = Set(hourlyForecasts.compactMap(\.temperature.value))
        if let currentTemp = currentCondition?.temperature.metric.value {
            temps.insert(currentTemp)
        }
        
        if !temps.isEmpty {
            return (hi: Int(temps.max()!), lo: Int(temps.min()!))
        } else {
            return (hi: nil, lo: nil)
        }
    }
}

// MARK: functions
extension HomeViewModel {
    private func subscriptLocationCoordinatePublisher() {
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
