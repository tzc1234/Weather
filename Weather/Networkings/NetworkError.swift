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
    case invalidServerResponse(path: String)
    case invalidStatusCode(path: String, statusCode: Int, errMsg: String)
    
    var errorMsg: String {
        switch self {
        case .urlInvalid(let urlStr):
            return "\(urlStr) Invalid."
        case .dataDecodeFailure(let error):
            return "\(error)"
        case .invalidServerResponse(let path):
            return "\(path): Invalid server response."
        case .invalidStatusCode(let path, let statusCode, let errMsg):
            return "(\(statusCode)) \(path): \(errMsg)"
        }
    }
}
