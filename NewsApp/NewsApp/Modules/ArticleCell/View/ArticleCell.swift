//
//  ArticleCell.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/8/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import UIKit
import Kingfisher

class ArticleCell: UITableViewCell {

    //MARK:- IBOutlet
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    static func instantiateFromNib(with viewModel: ArticleViewModel) -> ArticleCell {
        let cell = UINib(nibName: typeName, bundle: .main).instantiate(withOwner: self, options: nil).first as! ArticleCell
           return cell
       }
    
    func config(with viewModel: ArticleViewModel) {
        posterImageView.makeRoundedCorners(with: 8.0)
        
        posterImageView.kf.setImage(with: URL.init(string: viewModel.posterImageURL ?? ""), options: [
        .scaleFactor(UIScreen.main.scale),
        .transition(.fade(1)),
        .cacheOriginalImage
        ])
        
        self.headlineLabel.text = viewModel.headline
        self.dateLabel.text = viewModel.date
    }
    
}
