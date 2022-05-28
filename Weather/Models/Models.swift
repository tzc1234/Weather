//
//  Models.swift
//  Weather
//
//  Created by Tsz-Lung on 28/05/2022.
//

import Foundation

// MARK: - CurrentConditions
struct CurrentConditions: Codable {
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
}

// MARK: - RealFeelTemperature
struct RealFeelTemperature: Codable {
    let metric: Metric
}

// MARK: - Temperature
struct Temperature: Codable {
    let metric: Metric
}

// MARK: - Wind
struct Wind: Codable {
    let direction: Direction
    let speed: Speed
}

// MARK: - Direction
struct Direction: Codable {
    let degrees: Int
    let localized, english: String
}

// MARK: - Speed
struct Speed: Codable {
    let metric: Metric
}

// MARK: - Visibility
struct Visibility: Codable {
    let metric: Metric
}

// MARK: - Pressure
struct Pressure: Codable {
    let metric: Metric
}

// MARK: - PrecipitationSummary
struct PrecipitationSummary: Codable {
    let past24Hours: Past24Hours
}

// MARK: - PrecipitationSummary
struct Past24Hours: Codable {
    let metric: Metric
}

// MARK: - Metric
struct Metric: Codable {
    let value: Int?
    let unit: String
    let unitType: Int
}
