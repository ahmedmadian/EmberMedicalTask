//
//  ArticleDetailModuleBuilder.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/9/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation
import XCoordinator

class ArticleDetailModuleBuilder {
    // MARK:- Methods
    
     static func makeModule(router: UnownedRouter<AppStartUpRoute>,dataSource: ArticleViewModel) -> UIViewController {
         
         let viewController = ArticleDetailViewController.instantiate() as! ArticleDetailViewController
         viewController.viewModel = ArticleDetailViewModel(router: router, article: dataSource)
         return viewController
     }
    
}
