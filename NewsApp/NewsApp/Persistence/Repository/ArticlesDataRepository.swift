//
//  ArticlesDataRepository.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/12/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation

protocol ArticleRepository {
    func fetchAllArticles(completion: @escaping (([Article]?), Error?) -> ())
}

class ArticlesDataRepository: ArticleRepository{
    
    //MARK:- Properties
    private let remoteDataSource: NeswAPIDataSourceProtocol
    
    // MARK:- Initializers
    init(remoteDataSource: NeswAPIDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
    
    //MARK:- Methods
    func fetchAllArticles(completion: @escaping (([Article]?), Error?) -> ()) {
        remoteDataSource.fetchArticles(with: NewsAPIEndPoints.topHeadlines) { (articles, error) in
            completion(articles, error)
        }
    }
}
