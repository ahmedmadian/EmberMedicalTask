//
//  Lookup.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/13/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation

class Lookup {
    var name: String?
    var id: String?
    var type: PickerOption?
    
    init(id: String?, name: String?, type: PickerOption?) {
        self.id = id
        self.name = name
        self.type = type
    }
}

enum PickerOption {
    case country
    case Source
}

