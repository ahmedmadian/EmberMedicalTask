//
//  FilerDataUseCase.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/12/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation

protocol FilerDataUseCaseable {
    func fetchCountries() -> [Country]?
    func fetchSources() -> [Source]?
}

class FilerDataUseCase: FilerDataUseCaseable {
    
    //MARK:- Properties
    private let countryRepository: CountryRepository
    
    // MARK:- Initializers
    init(countryRepository: CountryRepository) {
        self.countryRepository = countryRepository
    }
    
    //MARK:- Methods
    func fetchCountries() -> [Country]? {
        return self.countryRepository.fetchCountries()
    }
    
    func fetchSources() -> [Source]? {
        return nil
    }
    
}
