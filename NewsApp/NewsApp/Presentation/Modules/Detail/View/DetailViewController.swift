//
//  ArticleDetailViewController.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/9/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import UIKit
import Kingfisher

class DetailViewController: BaseViewController {

    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    
    var viewModel: DetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        config(article: viewModel.article)
    }
    
    
    func config(article: ArticleViewModel) {
        self.headlineLabel.text = article.headline
        self.authorLabel.text = "By: \(article.authorName ?? "")"
        self.contentLabel.text = article.articleDescription
        mainImageView.kf.setImage(with: URL.init(string: article.posterImageURL ?? ""), options: [
        .scaleFactor(UIScreen.main.scale),
        .transition(.fade(1)),
        .cacheOriginalImage
        ])
    }

}
