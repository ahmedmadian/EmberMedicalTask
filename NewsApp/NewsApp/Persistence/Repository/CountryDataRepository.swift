//
//  CountryDataRepository.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/12/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation

protocol CountryRepository {
    func fetchCountries() -> [Country]?
}

class CountryDataRepository: CountryRepository{
    
    
    
    //MARK:- Properties
    private let localDataSource: CountryCodeDataSourceProtocol
    
    // MARK:- Initializers
    init(localDataSource: CountryCodeDataSourceProtocol) {
        self.localDataSource = localDataSource
    }
    
    func fetchCountries() -> [Country]? {
        return self.localDataSource.fetchCountries()
    }
    
}
