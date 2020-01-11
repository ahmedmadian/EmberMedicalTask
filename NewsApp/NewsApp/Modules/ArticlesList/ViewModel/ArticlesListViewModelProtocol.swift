//
//  ArticlesListViewModelProtocol.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/10/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation

import UIKit
import RxSwift
import RxCocoa

protocol ArticlesListViewModelInput {
    var loadTrigger: AnyObserver<Void> { get }
    //var selectItem: AnyObserver<ArticleViewModel> { get }
    //var filterTrigger: AnyObserver<Void> { get }
}

protocol ArticlesListViewModelOutput {
    var loading: Driver<Bool> { get }
    var data: Driver<[ArticleViewModel]> { get }
    var title: Driver<String> { get }
    var error: Driver<Error> { get }
    //var selectedItem: Driver<ArticleViewModel> { get }
    //var filterTriggered: Driver<Void> { get }
}

protocol ArticlesListViewModelType {
    var input: ArticlesListViewModelInput { get }
    var output: ArticlesListViewModelOutput { get }
}

extension ArticlesListViewModelType where Self: ArticlesListViewModelInput & ArticlesListViewModelOutput {
    var input: ArticlesListViewModelInput { return self }
    var output: ArticlesListViewModelOutput { return self }
}
