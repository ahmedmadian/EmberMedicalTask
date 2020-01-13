//
//  FilterDataViewModel.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/12/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation
import XCoordinator

class FilterDataViewModel {
    
    // MARK:- Properties
    private let router: UnownedRouter<AppStartUpRoute>
    private let useCase: FilerDataUseCaseable
    private let data: [FilterCellViewModel]
    
    var numberOfData: Int {
        return data.count
    }
    
    // MARK:- Initialization
    init(router: UnownedRouter<AppStartUpRoute>, useCase: FilerDataUseCaseable) {
        self.router = router
        self.useCase = useCase
        data = []
    }
    
    public func data(for indexPath: IndexPath) -> FilterCellViewModel {
        return data[indexPath.row]
    }
    
    func getFetchedData() {
    }
    
}
