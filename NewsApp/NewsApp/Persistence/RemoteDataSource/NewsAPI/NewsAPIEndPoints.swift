//
//  NewsAPIEndPoints.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/8/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation

enum NewsAPIEndPoints: String, Endpointed {
    
    case topHeadlines = "top-headlines"
    
    //MARK:- Properties
    private var schema: HTTPSchema {
        switch self {
        case .topHeadlines:
            return .HTTPS
        }
    }
    
    private var host: String {
        switch self {
        case .topHeadlines:
            return "newsapi.org"
        }
    }
    
    private var path: String {
        switch self {
        case .topHeadlines:
            return "v2"
        }
    }
    
    private var base: String {
        switch self {
        case .topHeadlines:
            return "\(schema.rawValue)://\(host)"
        }
    }
    
    var fullURL: String {
        switch self {
        case .topHeadlines:
            return "\(self.base)/\(self.path)/\(self.rawValue)"
        }
    }
    
    var parameters: [String : Any] {
        switch self {
        case .topHeadlines:
            return ["country": "us"]
        }
    }
    
    var headers: [String: String] {
        return [ HeaderParameterKeys.APIKey : HeaderParameterValues.APIKey]
    }
    
    var method: HTTPMethod {
        switch self {
        case .topHeadlines:
            return .get
        }
    }
}
