//
//  ArticlesDataRepository.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/12/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation

protocol ArticleRepository {
    func fetchTopHeadlines(_ lookup: Lookup?, completion: @escaping (([Article]?), Error?) -> ())
    //func fetchEveryThing(completion: @escaping (([Article]?, Error) -> ())
}

class ArticlesDataRepository: ArticleRepository{
    
    //MARK:- Properties
    private let remoteDataSource: NeswAPIDataSourceProtocol
    
    // MARK:- Initializers
    init(remoteDataSource: NeswAPIDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
    
    //MARK:- Methods
    func fetchTopHeadlines(_ lookup: Lookup?, completion: @escaping (([Article]?), Error?) -> ()) {
        let endPoint: NewsAPIEndPoints = .topHeadlines(lookup)
        remoteDataSource.fetchArticles(with: endPoint) { (articles, error) in
            completion(articles, error)
        }
    }
}
