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
        }
    }
    
    private func Config(nav: UINavigationController) {
        nav.navigationBar.prefersLargeTitles = true
                nav.navigationBar.backgroundColor = UIColor.black
                nav.navigationBar.barTintColor = UIColor.black
                nav.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)]
                nav.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
    }
}
