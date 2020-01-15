//
//  CountryCodeDataSource.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/12/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation

protocol CountryCodeDataSourceProtocol: LocalDataSource {
    func fetchCountries() -> [Country]?
}

final class CountryCodeDataSource:  CountryCodeDataSourceProtocol{
    
    //MARK:- Properties
    static let shared = CountryCodeDataSource()
    
    private let fileName = "countryISO2"
    private let fileType = "json"
    
    // MARK:- Initializers
    private init() {}
    
    func fetchCountries() -> [Country]? {
        let dto: CountryWrapper = self.fetchDataFrom(resource: fileName, ofType: fileType)!
        let countries = dto.data?.map { Country(name: $0.value, ios2: $0.key)}.sorted { $0.name! < $1.name! }
        return countries
    }
    
}

class CountryWrapper: Codable {
    var data: [String: String]?
    
    enum CodingKeys: String, CodingKey {
        case data
    }
}
