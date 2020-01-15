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
    var authorName: String?
    var articleDescription: String?
    var url: String?
    var sourceName: String?
    
    init(article: Article) {
        self.posterImageURL = article.urlToImage
        self.headline = article.title
        self.date = formatDate(with: article.publishedAt ?? "")
        self.authorName = article.author
        self.articleDescription = article.articleDescription
        self.url = article.url
        self.sourceName = article.source?.name
    }
    
    func formatDate(with stringDate: String) -> String {
        let date = DateConvertor.shared.getConverted(dateString: stringDate, fromFormat: .yyyyMMddTHHmmssZ, toFormat: .MMMdyyyyhmma)
        return date
    }
}
