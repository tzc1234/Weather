//
//  Models.swift
//  Weather
//
//  Created by Tsz-Lung on 28/05/2022.
//

import Foundation

// MARK: - CurrentCondition
struct CurrentCondition: Codable {
    let weatherText: String
    let weatherIcon: Int?
    let isDayTime: Bool
    let temperature: Temperature
    let realFeelTemperature: RealFeelTemperature
    let relativeHumidity: Int?
    let wind: Wind
    let uvIndex: Int?
    let uvIndexText: String
    let visibility: Visibility
    let pressure: Pressure
    let precipitationSummary: PrecipitationSummary
    
    enum CodingKeys: String, CodingKey {
        case weatherText = "WeatherText"
        case weatherIcon = "WeatherIcon"
        case isDayTime = "IsDayTime"
        case temperature = "Temperature"
        case realFeelTemperature = "RealFeelTemperature"
        case relativeHumidity = "RelativeHumidity"
        case wind = "Wind"
        case uvIndex = "UVIndex"
        case uvIndexText = "UVIndexText"
        case visibility = "Visibility"
        case pressure = "Pressure"
        case precipitationSummary = "PrecipitationSummary"
    }
}

extension CurrentCondition {
    var tempDouble: Double? {
        temperature.metric.value
    }
    
    var shortTempStr: String {
        let tempStr = tempDouble.tempStr
        return "\(tempStr) | \(weatherText)"
    }
}

// MARK: - RealFeelTemperature
struct RealFeelTemperature: Codable {
    let metric: Metric
    
    enum CodingKeys: String, CodingKey {
        case metric = "Metric"
    }
}

// MARK: - Temperature
struct Temperature: Codable {
    let metric: Metric
    
    enum CodingKeys: String, CodingKey {
        case metric = "Metric"
    }
}

// MARK: - Wind
struct Wind: Codable {
    let direction: Direction
    let speed: Speed
    
    enum CodingKeys: String, CodingKey {
        case direction = "Direction"
        case speed = "Speed"
    }
}

// MARK: - Direction
struct Direction: Codable {
    let degrees: Int
    let localized, english: String
    
    enum CodingKeys: String, CodingKey {
        case degrees = "Degrees"
        case localized = "Localized"
        case english = "English"
    }
}

// MARK: - Speed
struct Speed: Codable {
    let metric: Metric
    
    enum CodingKeys: String, CodingKey {
        case metric = "Metric"
    }
}

// MARK: - Visibility
struct Visibility: Codable {
    let metric: Metric
    
    enum CodingKeys: String, CodingKey {
        case metric = "Metric"
    }
}

// MARK: - Pressure
struct Pressure: Codable {
    let metric: Metric
    
    enum CodingKeys: String, CodingKey {
        case metric = "Metric"
    }
}

// MARK: - PrecipitationSummary
struct PrecipitationSummary: Codable {
    let past24Hours: Past24Hours
    
    enum CodingKeys: String, CodingKey {
        case past24Hours = "Past24Hours"
    }
}

// MARK: - PrecipitationSummary
struct Past24Hours: Codable {
    let metric: Metric
    
    enum CodingKeys: String, CodingKey {
        case metric = "Metric"
    }
}

// MARK: - Metric
struct Metric: Codable {
    let value: Double?
    let unit: String
    let unitType: Int
    let phrase: String?
    
    enum CodingKeys: String, CodingKey {
        case value = "Value"
        case unit = "Unit"
        case unitType = "UnitType"
        case phrase = "Phrase"
    }
}
