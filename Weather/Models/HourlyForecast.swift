//
//  HourlyForecast.swift
//  Weather
//
//  Created by Tsz-Lung on 29/05/2022.
//

import Foundation

// MARK: - HourlyForecast
struct HourlyForecast: Codable, Identifiable {
    let dateTime: String
    let epochDateTime: TimeInterval
    let weatherIcon: WeatherIcon
    let iconPhrase: String
    let hasPrecipitation, isDaylight: Bool
    let temperature: HourlyTemperature
    let precipitationProbability: Int

    enum CodingKeys: String, CodingKey {
        case dateTime = "DateTime"
        case epochDateTime = "EpochDateTime"
        case weatherIcon = "WeatherIcon"
        case iconPhrase = "IconPhrase"
        case hasPrecipitation = "HasPrecipitation"
        case isDaylight = "IsDaylight"
        case temperature = "Temperature"
        case precipitationProbability = "PrecipitationProbability"
    }
}

// MARK: computed variables
extension HourlyForecast {
    var id: Double {
        epochDateTime
    }
    
    var hourStr: String {
        let date = Date(timeIntervalSince1970: epochDateTime)
        let hour = Calendar.current.component(.hour, from: date)
        return String(format: "%02d", hour)
    }
    
    var tempStr: String {
        temperature.value.tempStr
    }
}

// MARK: - Temperature
struct HourlyTemperature: Codable {
    let value: Double?
    let unit: String
    let unitType: Int

    enum CodingKeys: String, CodingKey {
        case value = "Value"
        case unit = "Unit"
        case unitType = "UnitType"
    }
}
