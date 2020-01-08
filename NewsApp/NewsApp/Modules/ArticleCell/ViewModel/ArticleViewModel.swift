//
//  ArticleViewModel.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/8/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation

class ArticleViewModel {
    var posterImageURL: String?
    var headline: String?
    var date: String?
    
    init(article: Article) {
        self.posterImageURL = article.urlToImage
        self.headline = article.title
        self.date = formatDate(with: article.publishedAt ?? "")
    }
    
    func formatDate(with stringDate: String) -> String {
        let date = DateConvertor.shared.getConverted(dateString: stringDate, fromFormat: .yyyyMMddTHHmmssZ, toFormat: .MMMdyyyyhmma)
        return date
    }
}
