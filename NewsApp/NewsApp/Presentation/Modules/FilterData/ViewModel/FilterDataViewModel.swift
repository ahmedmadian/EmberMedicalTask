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
    private var selectedIndexPath: IndexPath?
    private var lookups: [Lookup]
    
    var numberOfData: Int {
        return data.count
    }
    
    // MARK:- Initialization
    init(router: UnownedRouter<AppStartUpRoute>, useCase: FilerDataUseCaseable) {
        self.router = router
        self.useCase = useCase
        data = []
        lookups = []
    }
    
    //MARK: - Methods
    
    public func data(for indexPath: IndexPath) -> FilterCellViewModel {
        return data[indexPath.row]
    }
    
    public func getFetchedData(completion: @escaping ()->() ) {
        useCase.getFetchedData { (response, error) in
            if let response = response {
                self.lookups = response
                self.data = response.map({FilterCellViewModel(id: $0.id, name: $0.name)})
                completion()
            }
        }
    }
    
    public func didSelectRow(current: IndexPath, willSelect: IndexPath) {
        data(for: current).isChecked = false
        data(for: willSelect).isChecked = true
        selectedIndexPath = willSelect
    }
    
    
    public func didSelectRow(at indexPath: IndexPath) {
        data[indexPath.row].isChecked = true
        selectedIndexPath = indexPath
    }
    
    public func cancelDidTapped() {
        router.trigger(.backFromFilterPicker)
    }
    
    public func doneDidTapped() {
        if let selected = selectedIndexPath {
            let lookup = lookups[selected.row]
            let searchTerm = Notification.Name(rawValue: searchDataNotificationKey)
            NotificationCenter.default.post(name: searchTerm, object: lookup)
            router.trigger(.backFromFilterPicker)
        }
    }
    
}

//MARK:- Notification Key
let searchDataNotificationKey = "news.searchTerm"
