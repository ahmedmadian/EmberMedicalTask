//
//  ArticleDetailViewModel.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/9/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation
import XCoordinator

class DetailViewModel: DetailViewModelType {
    
    // MARK:- Properties
    private let router: UnownedRouter<AppStartUpRoute>
    var data: ArticleViewModel
    
    init(router: UnownedRouter<AppStartUpRoute>, data: ArticleViewModel) {
        self.data = data
        self.router = router
    }
    
}
