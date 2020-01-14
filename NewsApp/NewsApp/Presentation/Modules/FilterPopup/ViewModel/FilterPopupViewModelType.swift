//
//  FilterPopupViewModelType.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/14/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation

protocol FilterPopupViewModelType {
    func dismiss()
    func selectCountry()
    func selectSource()
    func startFiltering(with lookup: Lookup)
}
