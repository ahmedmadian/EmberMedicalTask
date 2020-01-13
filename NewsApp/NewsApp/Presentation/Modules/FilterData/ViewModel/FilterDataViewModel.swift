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
    private var data: [FilterCellViewModel]
    private var selectedData: FilterCellViewModel?
    
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
    
    func getFetchedData(completion: @escaping ()->() ) {
        useCase.getFetchedData { (response, error) in
            if let response = response {
                self.data = response
                completion()
            }
        }
    }
    
    public func didSelectRow(current: IndexPath, willSelect: IndexPath) {
        data(for: current).isChecked = false
        data(for: willSelect).isChecked = true
    }
    
    
    public func didSelectRow(at indexPath: IndexPath) {
        data[indexPath.row].isChecked = true
    }
    
    public func cancelDidTapped() {
        router.trigger(.backFromFilterPicker)
    }
    
    public func doneDidTapped() {
        router.trigger(.backFromFilterPicker)
    }
    
}
