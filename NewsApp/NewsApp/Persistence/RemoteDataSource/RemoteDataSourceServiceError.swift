//
//  RemoteDataSourceServiceError.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/8/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation

enum RemoteDataSourceServiceError: LocalizedError {
    case parsingError
    case serverError(message: String, code: Int)
    
    var errorDescription: String? {
        switch self {
        case .parsingError: return "JSON Parsing Failure"
        case .serverError(let message, let code): return "\(message)<\(code)>"
        }
    }
}
