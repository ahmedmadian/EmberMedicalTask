//
//  ArticlesUseCase.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/12/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation


import Foundation

protocol ArticlesUseCaseable {
    func fetchArticles(completion: @escaping (([Article]?), Error?) -> ())
}

class ArticlesUseCase: ArticlesUseCaseable {
    
    //MARK:- Properties
    private let articlesRepository: ArticleRepository
    
    // MARK:- Initializers
    init(articlesRepository: ArticleRepository) {
        self.articlesRepository = articlesRepository
    }
    
    func fetchArticles(completion: @escaping (([Article]?), Error?) -> ()) {
        articlesRepository.fetchAllArticles { (articles, error) in
            completion(articles, error)
        }
    }
}
