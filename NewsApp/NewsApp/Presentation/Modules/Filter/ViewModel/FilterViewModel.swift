//
//  FilterViewModel.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/9/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation
import XCoordinator
import RxSwift
import RxCocoa

class FilterViewModel {
    
    // MARK:- Properties
    private let router: UnownedRouter<AppStartUpRoute>
    
    // MARK:- Initialization
    init(router: UnownedRouter<AppStartUpRoute>) {
        self.router = router
    }
    
    //MARK:- Methods
    public func dismiss() {
        router.trigger(.backToHome)
    }
    
    func selectCountryDidTapped() {
        router.trigger(.filterPicker(.country))
    }
    
    func selectSourceDidTapped() {
        router.trigger(.filterPicker(.Source))
    }
}
