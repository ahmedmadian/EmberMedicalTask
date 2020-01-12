//
//  LocalDataSource.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/12/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation

protocol LocalDataSource {
    func fetchDataFrom<Model:Codable>(resource fileName: String, ofType type:String) -> [Model]?
}

extension LocalDataSource {
   
    func fetchDataFrom<Model:Codable>(resource fileName: String, ofType type:String) -> [Model]? {
        guard let filePath = Bundle.main.path(forResource: fileName, ofType: type) else {return nil}
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: filePath), options: .mappedIfSafe) else {return nil}
        guard let items = try? JSONDecoder().decode([Model].self, from: data) else {return nil}
        return items
    }
}

