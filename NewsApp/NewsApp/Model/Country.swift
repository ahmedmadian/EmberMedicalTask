//
//  Country.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/12/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation

class Country: Codable {
    let name:String?
    let iso2: String?

    enum CodingKeys: String, CodingKey {
        case name
        case iso2 = "iso2"
    }
}
