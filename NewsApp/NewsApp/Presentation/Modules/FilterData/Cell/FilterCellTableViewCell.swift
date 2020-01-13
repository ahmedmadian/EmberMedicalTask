//
//  FilterCellTableViewCell.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/12/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import UIKit

class FilterCellTableViewCell: UITableViewCell {

    //MARK: IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    
    //MARK:- Methods
    static func instantiateFromNib(with viewModel: FilterCellViewModel) -> FilterCellTableViewCell {
        let cell = UINib(nibName: typeName, bundle: .main).instantiate(withOwner: self, options: nil).first as! FilterCellTableViewCell
        cell.configCell(with: viewModel)
        return cell
    }
    
    func configCell(with viewModel: FilterCellViewModel) {
        titleLabel.text = viewModel.title
        self.accessoryType = viewModel.isChecked ? .checkmark : .none
    }
}
