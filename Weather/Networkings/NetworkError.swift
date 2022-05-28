//
//  NetworkError.swift
//  Weather
//
//  Created by Tsz-Lung on 28/05/2022.
//

import Foundation

enum NetworkError: Error {
    case urlInvalid
    case dataDecodeFailure(Error)
    
    var errorMsg: String {
        switch self {
        case .urlInvalid:
            return "Url Invalid."
        case .dataDecodeFailure(let error):
            return "\(error)"
        }
    }
}
