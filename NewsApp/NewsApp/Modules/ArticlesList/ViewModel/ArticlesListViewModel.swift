//
//  ArticlesListViewModel.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/8/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import XCoordinator

class ArticlesListViewModel: ViewModelType {

    struct Input {
        let loadTrigger: Driver<Void>
        let selectItem: Driver<ArticleViewModel>
        let filterTrigger: Driver<Void>
    }

    struct Output {
        let loading: Driver<Bool>
        let articles: Driver<[ArticleViewModel]>
        let title: Driver<String>
        let error: Driver<Error>
        let selectedItem: Driver<ArticleViewModel>
        let filterTriggered: Driver<Void>
    }
    
    // MARK:- Properties
    private let router: UnownedRouter<AppStartUpRoute>
    private let articlesService: NeswAPIDataSourceProtocol
    private var articales: Driver<[ArticleViewModel]>?
    
   // MARK:- Initialization
    init(router: UnownedRouter<AppStartUpRoute>, dataSource: NeswAPIDataSourceProtocol) {
        self.router = router
        self.articlesService = dataSource
    }
}

// MARK:- Transfrom
extension ArticlesListViewModel {
    
    func transform(input: ArticlesListViewModel.Input) -> ArticlesListViewModel.Output {
        
        let selectedItem = input.selectItem.do(onNext: {self.router.trigger(.details(viewModel: $0))})
        
        let filtered = input.filterTrigger.do(onNext: {self.router.trigger(.filter)})

        let activityIndicator = ActivityIndicator()
        let loading = activityIndicator.asDriver()
        
        let errorTracker = ErrorTracker()
        let errors = errorTracker.asDriver()
        
        articales = input.loadTrigger.flatMapLatest { _ -> Driver<[ArticleViewModel]> in
            return self.articlesService.fetchArticles(with: NewsAPIEndPoints.topHeadlines)
                .trackActivity(activityIndicator)
                .trackError(errorTracker)
                .asDriverOnErrorJustComplete()
                .map {$0.map {ArticleViewModel(article: $0)}}
        }
        
        let title = Observable<String>.just("Top Headlines").asDriverOnErrorJustComplete()
        return Output(loading: loading, articles: articales!, title: title, error: errors, selectedItem: selectedItem, filterTriggered: filtered)
    }
    
}

