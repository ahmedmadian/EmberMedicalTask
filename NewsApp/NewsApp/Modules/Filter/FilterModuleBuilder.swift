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
    
    // MARK:- Methods
     static func makeModule(router: UnownedRouter<AppStartUpRoute>) -> UIViewController {
         let viewController = FilterViewController.instantiate() as! FilterViewController
         viewController.viewModel = FilterViewModel(router: router)
         return viewController
     }
}
