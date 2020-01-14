//
//  FilterPopupViewModel.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/9/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation
import XCoordinator

class FilterPopupViewModel {
   
    // MARK:- Properties
    private let router: UnownedRouter<AppStartUpRoute>
    private weak var popupDelegate: FilterPopUpDelegate?
    
    // MARK:- Initialization
    init(router: UnownedRouter<AppStartUpRoute>, delgate: FilterPopUpDelegate) {
        self.router = router
        self.popupDelegate = delgate
    }
    
    // MARK:- Methods
    public func dismiss() {
        router.trigger(.exit)
    }
    
    public func selectCountryDidTapped() {
        router.trigger(.picker(.country))
    }
    
    public func selectSourceDidTapped() {
        router.trigger(.picker(.Source))
    }
    
    public func filterDidTapped(with lookup: Lookup) {
        popupDelegate?.dismissWith(data: lookup)
        router.trigger(.exit)
    }
    
}


protocol FilterPopUpDelegate: class {
    func dismissWith(data: Any?)
}
