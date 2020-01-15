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
    
    init(name: String?, ios2: String?) {
        self.name = name
        self.iso2 = ios2
    }
}
