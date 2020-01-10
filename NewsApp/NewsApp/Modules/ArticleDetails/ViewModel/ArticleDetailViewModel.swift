//
//  ArticleDetailViewModel.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/9/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import XCoordinator

class ArticleDetailViewModel: ViewModelType {
    
   
   struct Input {
        let loadTrigger: Driver<Void>
    }

    struct Output {
        let headline: Driver<String>
        let author: Driver<String>
        let content: Driver<String>
        let sourceURL: Driver<String>
    }
    
    // MARK:- Properties
    private let router: UnownedRouter<AppStartUpRoute>
    let article: ArticleViewModel
    
    init(router: UnownedRouter<AppStartUpRoute>, article: ArticleViewModel) {
        self.article = article
        self.router = router
    }
    
    func transform(input: ArticleDetailViewModel.Input) -> ArticleDetailViewModel.Output {
        let headline = Observable<String>.just(article.headline!).asDriverOnErrorJustComplete()
        let author = Observable<String>.just("By: \(article.authorName ?? "")").asDriverOnErrorJustComplete()
        let content = Observable<String>.just(article.articleDescription!).asDriverOnErrorJustComplete()
        let sourceURL = Observable<String>.just(article.url!).asDriverOnErrorJustComplete()

        return Output(headline: headline, author: author, content: content, sourceURL: sourceURL)
    }
    
}
