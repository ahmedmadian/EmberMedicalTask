//
//  DetailModuleBuilder.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/9/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation
import XCoordinator

class DetailModuleBuilder {
    
    // MARK:- Methods
     static func makeModule(router: UnownedRouter<AppStartUpRoute>,dataSource: ArticleViewModel) -> UIViewController {
        let viewController: DetailViewController = Storyboards.main.instantiate()!
         viewController.viewModel = DetailViewModel(router: router, data: dataSource)
         return viewController
     }
    
}
