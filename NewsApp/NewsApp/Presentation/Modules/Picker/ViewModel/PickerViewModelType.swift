//
//  PickerViewModelType.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/14/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation

protocol PickerViewModelType {
    var numberOfData: Int { get }
    func data(for indexPath: IndexPath) -> PickerCellViewModel
    func getFetchedData(completion: @escaping ()->() )
    func didSelectRow(current: IndexPath, willSelect: IndexPath)
    func didSelectRow(at indexPath: IndexPath)
    func cancelDidTapped()
    func doneDidTapped()
}
