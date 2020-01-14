//
//  FilterCellViewModel.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/12/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation

class PickerCellViewModel {
    
    // MARK: - Properties
    var title: String?
    var id: String?
    var isChecked: Bool = false
    
    // MARK: - Initilization
    init(id: String?, name: String?) {
        self.title = name
        self.id = id
    }
}
