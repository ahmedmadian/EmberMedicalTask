//
//  FilterModuleBuilder.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/9/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation
import XCoordinator

class FilterModuleBuilder {
    
    static func makeModule(router: UnownedRouter<AppStartUpRoute>, popupDelegate: FilterPopUpDelegate) -> UIViewController {
        let viewController: FilterViewController = Storyboards.main.instantiate()!
        viewController.viewModel = FilterViewModel(router: router, delgate: popupDelegate)
        return viewController
    }
    
}
