//
//  NetworkManager.swift
//  Weather
//
//  Created by Tsz-Lung on 28/05/2022.
//

import Foundation

typealias WeatherData = (GeoPosition, [CurrentCondition])

protocol NetworkManager {
    func fetchWeatherData() async throws -> WeatherData
}

final class MockNetworkManager: NetworkManager {
    func fetchWeatherData() async throws -> WeatherData {
        guard
            let geoUrl = Bundle.main.url(forResource: "geoposition", withExtension: "json")
        else {
            throw NetworkError.urlInvalid
        }
        
        guard
            let currentConditionUrl = Bundle.main.url(forResource: "currentConditions", withExtension: "json")
        else {
            throw NetworkError.urlInvalid
        }
        
        let (geoData, _) = try await URLSession.shared.data(from: geoUrl)
        let (currentConditionData, _) = try await URLSession.shared.data(from: currentConditionUrl)
        
        do {
            let geoPosition = try JSONDecoder().decode(GeoPosition.self, from: geoData)
            let currentConditions = try JSONDecoder().decode([CurrentCondition].self, from: currentConditionData)
            return (geoPosition, currentConditions)
        } catch {
            throw NetworkError.dataDecodeFailure(error)
        }
    }
}
