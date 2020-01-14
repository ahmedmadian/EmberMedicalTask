//
//  ArticlesUseCase.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/12/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation

protocol ArticlesUseCaseable {
    func fetchTopHeadlines(with lookup: Lookup?, completion: @escaping (([Article]?), Error?) -> ())
}

class ArticlesUseCase: ArticlesUseCaseable {
    
    //MARK:- Properties
    private let articlesRepository: ArticleRepository
    
    // MARK:- Initializers
    init(articlesRepository: ArticleRepository) {
        self.articlesRepository = articlesRepository
    }
    
    func fetchTopHeadlines(with lookup: Lookup?, completion: @escaping (([Article]?), Error?) -> ()) {
        articlesRepository.fetchTopHeadlines(lookup) { (articles, error) in
            completion(articles, error)
        }
    }
}
