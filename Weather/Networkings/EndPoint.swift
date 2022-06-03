//
//  EndPoint.swift
//  Weather
//
//  Created by Tsz-Lung on 28/05/2022.
//

import Foundation

protocol EndPoint {
    var scheme: String { get }
    var baseURL: String { get }
    var path: String { get }
    var parameters: [URLQueryItem] { get }
    var method: String { get }
}

enum WeatherEndPoint: EndPoint {
    case geoposition(lat: Double, lon: Double)
    case currentConditions(locationKey: String)
    case hourlyForecasts(locationKey: String)
    
    var scheme: String {
        switch self {
        default:
            return "http"
        }
    }
    
    var baseURL: String {
        switch self {
        default:
            return "dataservice.accuweather.com"
        }
    }
    
    var path: String {
        switch self {
        case .geoposition:
            return "/locations/v1/cities/geoposition/search"
        case .currentConditions(let locationKey):
            return "/currentconditions/v1/\(locationKey)"
        case .hourlyForecasts(let locationKey):
            return "/forecasts/v1/hourly/12hour/\(locationKey)"
        }
    }
    
    var apiKey: String {
        let apiKey = ""
        assert(!apiKey.isEmpty, "Please set your AccuWeather apiKey in the WeatherEndPoint.")
        return apiKey
    }
    
    var parameters: [URLQueryItem] {
        var params: [URLQueryItem]
        
        switch self {
        case .geoposition(let lat, let lon):
            params = [URLQueryItem(name: "q", value: "\(lat),\(lon)")]
        case .currentConditions:
            params = [URLQueryItem(name: "details", value: "true")]
        case .hourlyForecasts:
            params = [URLQueryItem(name: "metric", value: "true")]
        }
        
        params.append(URLQueryItem(name: "apikey", value: apiKey))
        return params
    }
    
    var method: String {
        switch self {
        default:
            return "get"
        }
    }
}
