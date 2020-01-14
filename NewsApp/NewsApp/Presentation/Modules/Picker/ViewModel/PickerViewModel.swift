//
//  PickerViewModel.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/12/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation
import XCoordinator

class PickerViewModel: PickerViewModelType {
    
    // MARK:- Private Fields
    private let router: UnownedRouter<AppStartUpRoute>
    private let useCase: FilerDataUseCaseable
    private var data: [PickerCellViewModel]
    private var selectedIndexPath: IndexPath?
    private var lookups: [Lookup]
    
    // MARK:- Properties
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
    
    //MARK:- Methods
    public func data(for indexPath: IndexPath) -> PickerCellViewModel {
        return data[indexPath.row]
    }
    
    public func getFetchedData(completion: @escaping ()->() ) {
        useCase.getFetchedData { (response, error) in
            if let response = response {
                self.lookups = response
                self.data = response.map({PickerCellViewModel(id: $0.id, name: $0.name)})
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
        router.trigger(.exit)
    }
    
    public func doneDidTapped() {
        if let selected = selectedIndexPath {
            let lookup = lookups[selected.row]
            let searchTerm = Notification.Name(rawValue: searchDataNotificationKey)
            NotificationCenter.default.post(name: searchTerm, object: lookup)
            router.trigger(.exit)
        }
    }
    
}

//MARK:- Notification Key
let searchDataNotificationKey = "news.searchTerm"
