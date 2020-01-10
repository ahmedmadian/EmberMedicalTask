//
//  FilterViewModel.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/9/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation
import XCoordinator
import RxSwift
import RxCocoa

class FilterViewModel: ViewModelType {
    
    struct Input {
        //let loadTrigger: Driver<Void>
        let exitTrigger: Driver<Void>
    }

    struct Output {
        //let loading: Driver<Bool>
        //let articles: Driver<[ArticleViewModel]>
        //let error: Driver<Error>
        //let selectedItem: Driver<ArticleViewModel>
        //let filterTriggered: Driver<Void>
        let exitTriggered: Driver<Void>
    }
    
    // MARK:- Properties
    private let router: UnownedRouter<AppStartUpRoute>
    
    // MARK:- Initialization
    init(router: UnownedRouter<AppStartUpRoute>) {
        self.router = router
    }
    
    func transform(input: FilterViewModel.Input) -> FilterViewModel.Output {
        let exitTriggered = input.exitTrigger.do(onNext: {
            self.router.trigger(.backToHome) })
        return Output(exitTriggered: exitTriggered)
    }
    
    
    
}
