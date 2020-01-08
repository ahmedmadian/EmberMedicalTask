//
//  RemoteDataSource.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/8/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Alamofire

protocol RemoteDataSource {
    func execute<Model:Codable>(endPoint: Endpointed, completionHandler: @escaping (Swift.Result<Model, Error>) -> Void )
}

extension RemoteDataSource {
    func execute<Model:Codable>(endPoint: Endpointed, completionHandler: @escaping (Swift.Result<Model, Error>) -> Void ) {
        
        var generalParameters = [String:Any]()
        generalParameters.merge(with: endPoint.parameters)
        
        var generalHeaders = [String: String]()
        generalHeaders.merge(with: endPoint.headers)
        
        Alamofire.request(endPoint.fullURL, method: Alamofire.HTTPMethod.init(rawValue: endPoint.method.rawValue)!, parameters: generalParameters, headers: generalHeaders).responseData { (response) in
            switch response.result {
            case .success(let data):
                do {
                    let object = try JSONDecoder().decode(Model.self, from: data)
                    completionHandler(Swift.Result.success(object))
                }
                catch {
                    completionHandler(Swift.Result.failure(RemoteDataSourceServiceError.parsingError))
                }
            case .failure(let error):
                completionHandler(Swift.Result.failure(RemoteDataSourceServiceError.serverError(message: error.localizedDescription, code: error.code)))
            }
        }
    }
}
