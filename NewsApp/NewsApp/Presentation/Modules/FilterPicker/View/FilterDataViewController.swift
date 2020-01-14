//
//  FilterDataViewController.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/12/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import UIKit

class FilterDataViewController: BaseViewController {

    //MARK:- IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK:- Properties
    var viewModel: FilterPickerViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showLoader(with: "Loading ..")
        viewModel.getFetchedData {
            self.hideLoader()
            self.tableView.reloadData()
        }
    }
    
    //MARK:- IBAction
    @IBAction func cancelDidTapped(_ sender: Any) {
        viewModel.cancelDidTapped()
    }
    @IBAction func doneDidTapped(_ sender: Any) {
        viewModel.doneDidTapped()
    }
    
    var currentSelectedIndex: IndexPath!
    var firstSelected: Bool = true
}

// MARK:- UITableViewDataSource
extension FilterDataViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfData
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = viewModel.data(for: indexPath)
        let cell = PickerCell.instantiateFromNib(with: data)
        return cell
    }
    
}

//MARK:- UITableViewDelegate

extension FilterDataViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if firstSelected {
            viewModel.didSelectRow(at: indexPath)
            let cell = tableView.cellForRow(at: indexPath) as! PickerCell
            cell.configCell(with: viewModel.data(for: indexPath))
            currentSelectedIndex = indexPath
            firstSelected = false
        } else {
            viewModel.didSelectRow(current: currentSelectedIndex, willSelect: indexPath)
            let deSelectedCell = tableView.cellForRow(at: currentSelectedIndex) as! PickerCell
            let currentCell = tableView.cellForRow(at: indexPath) as! PickerCell
            deSelectedCell.configCell(with: viewModel.data(for: currentSelectedIndex))
            currentCell.configCell(with: viewModel.data(for: indexPath))
            currentSelectedIndex = indexPath
        }
    }
    
}

