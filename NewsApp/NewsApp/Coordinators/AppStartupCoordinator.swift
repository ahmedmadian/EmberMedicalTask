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
    case detail(viewModel: ArticleViewModel)
    case filterPopup
    case exit
    case picker(PickerOption)
}

class AppStartUpCoordinator: NavigationCoordinator<AppStartUpRoute> {

    // MARK:- Initlization
    init() {
        super.init(initialRoute: .home)
    }

    // MARK:- Methods
    override func prepareTransition(for route: AppStartUpRoute) -> NavigationTransition {
        Config(navigationController: self.rootViewController)
        switch route {
        case .home:
            let articlesView = HomeModuleBuilder.makeModule(router: unownedRouter)
            return .push(articlesView)
        case .detail(let viewModel):
            let detailView = DetailModuleBuilder.makeModule(router: unownedRouter, dataSource: viewModel)
            return .push(detailView)
        case .filterPopup :
            let parentVC = rootViewController.children.last as! HomeViewController
            let filterView = FilterPopupModuleBuilder.makeModule(router: unownedRouter, popupDelegate: parentVC)
            return .presentOverCurrentContext(filterView)
        case .picker(let option):
            let filterPicker = PickerModuleBuilder.makeModule(router: unownedRouter, with: option)
            return .presentOverCurrentContext(filterPicker)
        case .exit:
            return .dismiss()
        }
    }
    
    private func Config(navigationController: UINavigationController) {
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
        navigationController.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
        navigationController.navigationBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
}
