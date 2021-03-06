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
    @IBOutlet weak var containerView: UIView!
    
    // MARK: - Methods
    static func instantiateFromNib(with viewModel: ArticleViewModel) -> ArticleCell {
        let cell = UINib(nibName: typeName, bundle: .main).instantiate(withOwner: self, options: nil).first as! ArticleCell
        cell.config(with: viewModel)
        return cell
    }
    
    private func config(with viewModel: ArticleViewModel) {
        posterImageView.makeRoundedCorners(with: 15.0)
        containerView.makeRoundedCorners(with: 20)
        if let imageURL = viewModel.posterImageURL {
            posterImageView.kf.setImage(with: URL.init(string: imageURL ), options: [
            .scaleFactor(UIScreen.main.scale),
            .transition(.fade(1)),
            .cacheOriginalImage,
            ])
        } else {
            posterImageView.image = UIImage(named: "logo")
            posterImageView.contentMode = .center
        }
        
        self.headlineLabel.text = viewModel.headline
        self.dateLabel.text = viewModel.date
       animateCell()
    }
    
    private func animateCell() {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 0, 50, 0)
        self.layer.transform = rotationTransform
        self.alpha = 0.5
        UIView.animate(withDuration: 1.0) {
            self.layer.transform = CATransform3DIdentity
            self.alpha = 1.0
        }
    }
    
}
