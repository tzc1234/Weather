//
//  HomeViewModel.swift
//  Weather
//
//  Created by Tsz-Lung on 28/05/2022.
//

import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    @Published private(set) var geoPosition: GeoPosition?
    @Published private(set) var currentConditions: [CurrentCondition] = []
    
    let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
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
    func fetchWeathData() async {
        do {
            (geoPosition, currentConditions) = try await networkManager.fetchWeatherData()
        } catch {
            let errMsg = (error as? NetworkError)?.errorMsg ?? error.localizedDescription
            print(errMsg)
        }
    }
}
