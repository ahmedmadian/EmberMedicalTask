//
//  ArticlesModuleBuilder.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/9/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation
import XCoordinator

class ArticlesModuleBuilder {
    static func makeModule(router: UnownedRouter<AppStartUpRoute>,dataSource: NeswAPIDataSourceProtocol = NewsAPIRemoteDataSource.shared) -> UIViewController {
        
        let viewController = ArticlesListViewController.instantiate() as! ArticlesListViewController
        viewController.viewModel = ArticlesListViewModel(router: router, dataSource: dataSource)
        return viewController
    }
}
