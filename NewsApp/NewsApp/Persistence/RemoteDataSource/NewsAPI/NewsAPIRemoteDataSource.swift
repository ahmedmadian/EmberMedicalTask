//
//  NewsAPIRemoteDataSource.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/8/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation

protocol NeswAPIDataSourceProtocol: RemoteDataSource {
    func fetchArticles(with endPoint: Endpointed, completion: @escaping (([Article]?), Error?) -> ())
}

class NewsAPIRemoteDataSource: NeswAPIDataSourceProtocol {
    
    //MARK:- Properties
    static let shared = NewsAPIRemoteDataSource()
    
    // MARK:- Initializers
    private init() {}
    
    //MAERK:- Remote Data Source
    
    func fetchArticles(with endPoint: Endpointed, completion: @escaping (([Article]?), Error?) -> ()) {
        self.execute(endPoint: endPoint) { (result: Result<ResponseWrapper, Error>) in
            switch result {
            case .success(let response):
                completion(response.articles, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}

class ResponseWrapper: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}
