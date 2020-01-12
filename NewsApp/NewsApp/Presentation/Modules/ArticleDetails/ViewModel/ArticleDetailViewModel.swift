//
//  ArticleDetailViewModel.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/9/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation
import XCoordinator

class ArticleDetailViewModel {
    
    
    // MARK:- Properties
    private let router: UnownedRouter<AppStartUpRoute>
    let article: ArticleViewModel
    
    init(router: UnownedRouter<AppStartUpRoute>, article: ArticleViewModel) {
        self.article = article
        self.router = router
    }
    
    
}
