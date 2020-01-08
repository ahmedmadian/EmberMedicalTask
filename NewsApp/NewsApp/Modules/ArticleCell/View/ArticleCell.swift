//
//  ArticleCell.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/8/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import UIKit

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
        self.headlineLabel.text = viewModel.headline
        self.dateLabel.text = viewModel.date
    }
    
}
