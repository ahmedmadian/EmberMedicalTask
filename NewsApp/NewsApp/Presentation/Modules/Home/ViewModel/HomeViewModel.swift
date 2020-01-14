//
//  HomeViewModel.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/8/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation
import XCoordinator

class HomeViewModel: HomeViewModelType {
    
    // MARK:- Properties
    private let router: UnownedRouter<AppStartUpRoute>
    private let useCase: ArticlesUseCaseable
    private var articales: [ArticleViewModel]
    
    public var errorMessage: String
    public var numberOfArticles: Int {return articales.count}
    public var title: String = "News App"
    
   // MARK:- Initialization
    init(router: UnownedRouter<AppStartUpRoute>, useCase: ArticlesUseCaseable) {
        self.router = router
        self.useCase = useCase
        self.errorMessage = ""
        articales = []
    }
        
    // MARK:- Methods
    func article(for indexPath: IndexPath) -> ArticleViewModel{
        return articales[indexPath.row]
    }
    
    public func didSelectRow(at indexPath: IndexPath) {
        let articleViewModel = self.article(for: indexPath)
        router.trigger(.detail(viewModel: articleViewModel))
    }
    
    public  func didLaunchFilterView() {
        router.trigger(.filterPopup)
    }
    
    public func loadArticles(with lookup:Lookup?, completion: @escaping (Bool) -> ()) {
        if let lookup = lookup { self.title = lookup.name!}
        useCase.fetchTopHeadlines(with: lookup) { (articles, error) in
            if let articles = articles {
                self.articales = articles.map {ArticleViewModel(article: $0)}
                completion(true)
            } else if let error = error {
                self.errorMessage = error.localizedDescription
                completion(false)
            }
        }
    }
}
