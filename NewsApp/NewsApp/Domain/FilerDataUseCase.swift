//
//  FilerDataUseCase.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/12/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation

protocol FilerDataUseCaseable {
    func getFetchedData(completion: @escaping (([Lookup]?), Error?) -> ())
}

class FilerDataUseCase: FilerDataUseCaseable {
    
    // MARK: - Properties
    private let countryRepository: CountryRepository
    private let sourceRepository: SourceRepository
    private let selector: PickerOption
    
    // MARK: - Initializers
    init(countryRepository: CountryRepository, sourceRepository: SourceRepository, selector: PickerOption) {
        self.countryRepository = countryRepository
        self.sourceRepository = sourceRepository
        self.selector = selector
    }
    
    // MARK: - Methods
    private func fetchCountries() -> [Country]? {
        return self.countryRepository.fetchCountries()
    }
    
    private func fetchSources(completion: @escaping (([Source]?), Error?) -> ()) {
        self.sourceRepository.fetchSources { (sources, error) in
            completion(sources, error)
        }
    }
    
    // MARK: - FilerDataUseCaseable
    func getFetchedData(completion: @escaping (([Lookup]?), Error?) -> ()) {
        switch selector {
        case .country:
            let countries = self.fetchCountries()
            let data = countries?.map({ Lookup(id: $0.iso2, name: $0.name, type: .country)})
            completion(data, nil)
        case .Source:
            self.fetchSources { (sources, error) in
                if let sources = sources {
                    let data = sources.map { Lookup(id: $0.id, name: $0.name, type: .Source)}
                    completion(data, nil)
                } else {
                    completion(nil, error)
                }
            }
        }
    }
    
}
