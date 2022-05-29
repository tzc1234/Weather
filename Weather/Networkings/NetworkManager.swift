//
//  NetworkManager.swift
//  Weather
//
//  Created by Tsz-Lung on 28/05/2022.
//

import Foundation

typealias WeatherData = (GeoPosition, [CurrentCondition], [HourlyForecast])

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
        
        guard
            let hourlyForcastsUrl = Bundle.main.url(forResource: "hourlyForecasts", withExtension: "json")
        else {
            throw NetworkError.urlInvalid
        }
        
        let (geoData, _) = try await URLSession.shared.data(from: geoUrl)
        let (currentConditionData, _) = try await URLSession.shared.data(from: currentConditionUrl)
        let (hourlyForcastsData, _) = try await URLSession.shared.data(from: hourlyForcastsUrl)
        
        do {
            let geoPosition = try JSONDecoder().decode(GeoPosition.self, from: geoData)
            let currentConditions = try JSONDecoder().decode([CurrentCondition].self, from: currentConditionData)
            let hourlyForcasts = try JSONDecoder().decode([HourlyForecast].self, from: hourlyForcastsData)
            return (geoPosition, currentConditions, hourlyForcasts)
        } catch {
            throw NetworkError.dataDecodeFailure(error)
        }
    }
}
