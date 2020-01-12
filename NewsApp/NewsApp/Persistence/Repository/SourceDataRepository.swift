//
//  SourceDataRepository.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/12/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation

protocol SourceRepository {
    func fetchSources(completion: @escaping (([Source]?), Error?) -> ())
}

class SourceDataRepository: SourceRepository {
   
    //MARK:- Properties
    private let remoteDataSource: NeswAPIDataSourceProtocol
    
    // MARK:- Initializers
    init(remoteDataSource: NeswAPIDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
    
    func fetchSources(completion: @escaping (([Source]?), Error?) -> ()) {
        self.remoteDataSource.fetchSources(with: NewsAPIEndPoints.sources) { (sources, error) in
            completion(sources, error)
        }
    }
}
