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
    case currentConditions
    
    var scheme: String {
        switch self {
        default:
            return "https"
        }
    }
    
    var baseURL: String {
        switch self {
        case .currentConditions:
            return "currentConditions.json"
        }
    }
    
    var path: String {
        switch self {
        case .currentConditions:
            return "currentconditions/v1"
        }
    }
    
    var parameters: [URLQueryItem] {
        switch self {
        default:
            return []
        }
    }
    
    var method: String {
        switch self {
        default:
            return "get"
        }
    }
}
