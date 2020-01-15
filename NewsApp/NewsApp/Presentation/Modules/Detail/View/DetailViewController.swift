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

    // MARK: - IBOutlet
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    
    //MARK: - ViewModel
    var viewModel: DetailViewModelType!
    
    //MARK: - Callbacks
    override func viewDidLoad() {
        super.viewDidLoad()
        config(article: viewModel.data)
    }
    
    //MARK: - Methods
    private func config(article: ArticleViewModel) {
        self.headlineLabel.text = article.headline
        self.authorLabel.text = "By: \(article.authorName ?? article.sourceName ?? "")"
        self.contentLabel.text = article.articleDescription
        mainImageView.kf.setImage(with: URL.init(string: article.posterImageURL ?? ""), options: [
        .scaleFactor(UIScreen.main.scale),
        .transition(.fade(1)),
        .cacheOriginalImage
        ])
    }

}
