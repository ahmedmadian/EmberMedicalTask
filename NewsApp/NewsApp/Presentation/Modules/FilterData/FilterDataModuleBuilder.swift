//
//  FilterDataModuleBuilder.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/12/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation
import XCoordinator

class FilterDataModuleBuilder {
    
    static func makeModule(router: UnownedRouter<AppStartUpRoute>,dataSource: NeswAPIDataSourceProtocol = NewsAPIRemoteDataSource.shared) -> UIViewController {
        let viewController: ArticlesListViewController = Storyboards.main.instantiate()!
        let dataRepo = ArticlesDataRepository(remoteDataSource: dataSource)
        let useCase = ArticlesUseCase(articlesRepository: dataRepo)
        viewController.viewModel = ArticlesListViewModel(router: router, useCase: useCase)
        return viewController
    }
}
