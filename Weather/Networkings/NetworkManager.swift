//
//  NetworkManager.swift
//  Weather
//
//  Created by Tsz-Lung on 28/05/2022.
//

import Foundation

typealias WeatherData = (GeoPosition, [CurrentCondition], [HourlyForecast])

protocol NetworkManager {
    func fetchWeatherData(lat: Double, lon: Double) async throws -> WeatherData
}

// MARK: - WeatherNetworkManager
final class WeatherNetworkManager: NetworkManager {
    private func getComponents(endPoint: WeatherEndPoint) -> URLComponents {
        var components = URLComponents()
        components.scheme = endPoint.scheme
        components.host = endPoint.baseURL
        components.path = endPoint.path
        components.queryItems = endPoint.parameters
        return components
    }
    
    private func request(endPoint: WeatherEndPoint) async throws -> Data {
        guard let url = getComponents(endPoint: endPoint).url else {
            throw NetworkError.urlInvalid(endPoint.path)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endPoint.method
        
        let (data, response) = try await URLSession(configuration: .default).data(for: request)
        
        guard let response = response as? HTTPURLResponse else {
            throw NetworkError.invalidServerResponse(endPoint.path)
        }
        
        let statusCode = response.statusCode
        guard 200..<300 ~= statusCode else {
            let errorData = try JSONDecoder().decode(ErrorData.self, from: data)
            throw NetworkError.invalidStatusCode(path: endPoint.path, statusCode: statusCode, errMsg: errorData.message)
        }
        
        return data
    }
    
    func fetchWeatherData(lat: Double, lon: Double) async throws -> WeatherData {
        let geoData = try await request(endPoint: .geoposition(lat: lat, lon: lon))
        let geo = try JSONDecoder().decode(GeoPosition.self, from: geoData)

        async let currentConditionsData = request(endPoint: .currentConditions(locationKey: geo.key))
        async let hourlyForecastsData = request(endPoint: .hourlyForecasts(locationKey: geo.key))

        let currentConditions = try await JSONDecoder().decode([CurrentCondition].self, from: currentConditionsData)
        let hourlyForecasts = try await JSONDecoder().decode([HourlyForecast].self, from: hourlyForecastsData)

        return (geo, currentConditions, hourlyForecasts)
    }
}

// MARK: - MockNetworkManager
final class MockNetworkManager: NetworkManager {
    func fetchWeatherData(lat: Double, lon: Double) async throws -> WeatherData {
        guard
            let geoUrl = Bundle.main.url(forResource: "geoposition", withExtension: "json")
        else {
            throw NetworkError.urlInvalid("geoposition")
        }
        
        guard
            let currentConditionUrl = Bundle.main.url(forResource: "currentConditions", withExtension: "json")
        else {
            throw NetworkError.urlInvalid("currentConditions")
        }
        
        guard
            let hourlyForcastsUrl = Bundle.main.url(forResource: "hourlyForecasts", withExtension: "json")
        else {
            throw NetworkError.urlInvalid("hourlyForecasts")
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
