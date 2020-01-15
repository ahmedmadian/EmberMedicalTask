//
//  HomeViewModelType.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/14/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation

protocol HomeViewModelType {
    var numberOfArticles: Int { get }
    var title: String { get }
    var errorMessage: String? { get }
    func article(for indexPath: IndexPath) -> ArticleViewModel
    func didSelectRow(at indexPath: IndexPath)
    func loadArticles(with lookup:Lookup?, completion: @escaping (Bool) -> ())
    func didLaunchFilterView()
    func sourceTitle(fot indexPath: IndexPath) -> String?
}
