//
//  NetworkError.swift
//  Weather
//
//  Created by Tsz-Lung on 28/05/2022.
//

import Foundation

enum NetworkError: Error {
    case urlInvalid(String)
    case dataDecodeFailure(Error)
    case invalidServerResponse
    
    var errorMsg: String {
        switch self {
        case .urlInvalid(let urlStr):
            return "Url: \(urlStr) Invalid."
        case .dataDecodeFailure(let error):
            return "\(error)"
        case .invalidServerResponse:
            return "Invalid Server Response."
        }
    }
}
