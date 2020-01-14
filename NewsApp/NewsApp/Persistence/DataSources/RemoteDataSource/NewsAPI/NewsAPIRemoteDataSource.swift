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
    func fetchSources(with endpoint: Endpointed, completion: @escaping (([Source]?), Error?) -> ())
}

class NewsAPIRemoteDataSource: NeswAPIDataSourceProtocol {
    
    
    //MARK:- Properties
    static let shared = NewsAPIRemoteDataSource()
    
    // MARK:- Initializers
    private init() {}
    
    //MAERK:- Remote Data Source
    func fetchArticles(with endPoint: Endpointed, completion: @escaping (([Article]?), Error?) -> ()) {
        self.execute(endPoint: endPoint) { (result: Result<ArticleResponseWrapper, Error>) in
            switch result {
            case .success(let response):
                completion(response.articles, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func fetchSources(with endpoint: Endpointed, completion: @escaping (([Source]?), Error?) -> ()) {
       self.execute(endPoint: endpoint) { (result: Result<SourceResponseWrapper, Error>) in
            switch result {
            case .success(let response):
                completion(response.sources, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }

    }
}


class ArticleResponseWrapper: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

class SourceResponseWrapper: Codable {
    let status: String
    let sources: [Source]
}
