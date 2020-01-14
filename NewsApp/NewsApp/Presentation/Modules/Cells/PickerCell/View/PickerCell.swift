//
//  FilterCellTableViewCell.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/12/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import UIKit

class PickerCell: UITableViewCell {

    //MARK: IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    
    //MARK:- Methods
    static func instantiateFromNib(with viewModel: PickerCellViewModel) -> PickerCell {
        let cell = UINib(nibName: typeName, bundle: .main).instantiate(withOwner: self, options: nil).first as! PickerCell
        cell.configCell(with: viewModel)
        return cell
    }
    
    func configCell(with viewModel: PickerCellViewModel) {
        titleLabel.text = viewModel.title
        self.accessoryType = viewModel.isChecked ? .checkmark : .none
    }
}
