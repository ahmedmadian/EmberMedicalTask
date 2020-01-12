//
//  ArticleDetailViewController.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/9/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import UIKit
import Kingfisher

class ArticleDetailViewController: BaseViewController {

    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var sourceURLLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    
    var viewModel: ArticleDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        config(article: viewModel.article)
        setupNavigationBar()
    }
    
    func setupNavigationBar () {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    
    
    func config(article: ArticleViewModel) {
        self.headlineLabel.text = article.headline
        self.authorLabel.text = "By: \(article.authorName ?? "")"
        self.contentLabel.text = article.articleDescription
        self.sourceURLLabel.text = "Source: \(article.url ?? "" )"
        mainImageView.kf.setImage(with: URL.init(string: article.posterImageURL ?? ""), options: [
        .scaleFactor(UIScreen.main.scale),
        .transition(.fade(1)),
        .cacheOriginalImage
        ])
    }

}
