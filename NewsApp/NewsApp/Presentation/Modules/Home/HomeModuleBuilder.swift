//
//  HomeModuleBuilder.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/9/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation
import XCoordinator

class HomeModuleBuilder {
    
    static func makeModule(router: UnownedRouter<AppStartUpRoute>,dataSource: NeswAPIDataSourceProtocol = NewsAPIRemoteDataSource.shared) -> UIViewController {
        let viewController: HomeViewController = Storyboards.main.instantiate()!
        let dataRepo = ArticlesDataRepository(remoteDataSource: dataSource)
        let useCase = ArticlesUseCase(articlesRepository: dataRepo)
        viewController.viewModel = HomeViewModel(router: router, useCase: useCase)
        return viewController
    }
}
