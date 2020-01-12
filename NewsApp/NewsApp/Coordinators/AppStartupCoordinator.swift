//
//  AppStartupCoordinator.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/9/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation
import XCoordinator

enum AppStartUpRoute: Route {
    case home
    case details(viewModel: ArticleViewModel)
    case filter
    case backToHome
}

class AppStartUpCoordinator: NavigationCoordinator<AppStartUpRoute> {

    init() {
        super.init(initialRoute: .home)
    }

    override func prepareTransition(for route: AppStartUpRoute) -> NavigationTransition {
        Config(navigationController: self.rootViewController)
        switch route {
        case .home:
            let articlesView = ArticlesModuleBuilder.makeModule(router: unownedRouter)
            return .push(articlesView)
        case .details(let viewModel):
            let detailView = ArticleDetailModuleBuilder.makeModule(router: unownedRouter, dataSource: viewModel)
            return .push(detailView)
        case .filter :
            let filterView = FilterModuleBuilder.makeModule(router: unownedRouter)
            return .presentFullScreen(filterView, animation: .fade)
        case .backToHome:
            return .dismiss(animation: .fade)
        }
    }
    
    private func Config(navigationController: UINavigationController) {
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.backgroundColor = #colorLiteral(red: 0.4500938654, green: 0.9813225865, blue: 0.4743030667, alpha: 1)
        navigationController.navigationBar.barTintColor = #colorLiteral(red: 0.4500938654, green: 0.9813225865, blue: 0.4743030667, alpha: 1)
        navigationController.navigationBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navigationController.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
        navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)]
    }
}
