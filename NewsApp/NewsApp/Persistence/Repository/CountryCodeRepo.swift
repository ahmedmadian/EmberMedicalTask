//
//  CountryCodeRepo.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/12/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation

protocol CountryCodeRepository {
    func fetchCountries() -> [Country]
}

