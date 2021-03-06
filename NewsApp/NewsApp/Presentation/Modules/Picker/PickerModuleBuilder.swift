//
//  PickerModuleBuilder.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/12/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation
import XCoordinator

class PickerModuleBuilder {
    
    static func makeModule(router: UnownedRouter<AppStartUpRoute>,with selector: PickerOption, remoteDataSource: NeswAPIDataSourceProtocol = NewsAPIRemoteDataSource.shared, localDataSource: CountryCodeDataSourceProtocol = CountryCodeDataSource.shared) -> UIViewController {
        
        let viewController: PickerController = Storyboards.main.instantiate()!
        
        let sourcesRepo = SourceDataRepository(remoteDataSource: remoteDataSource)
        let countryRepo = CountryDataRepository(localDataSource: localDataSource)
        
        let useCase = FilerDataUseCase(countryRepository: countryRepo, sourceRepository: sourcesRepo, selector: selector)
        
        viewController.viewModel = PickerViewModel(router: router, useCase: useCase)
        return viewController
    }
}

