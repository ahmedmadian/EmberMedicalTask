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
}

class AppStartUpCoordinator: NavigationCoordinator<AppStartUpRoute> {

    init() {
        super.init(initialRoute: .home)
    }

    override func prepareTransition(for route: AppStartUpRoute) -> NavigationTransition {
        Config(nav: self.rootViewController)
        switch route {
        case .home:
            let articlesView = ArticlesModuleBuilder.makeModule(router: unownedRouter)
            return .push(articlesView)
        case .details(let viewModel):
            //print(viewModel.headline)
            let detailView = ArticleDetailModuleBuilder.makeModule(router: unownedRouter, dataSource: viewModel)
            return .push(detailView)
        }
    }
    
    private func Config(nav: UINavigationController) {
        nav.navigationBar.isTranslucent = false
        nav.navigationBar.prefersLargeTitles = true
        nav.navigationBar.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
        nav.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
        nav.navigationBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        nav.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
        nav.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
    }
}
