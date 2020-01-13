//
//  FilterDataViewController.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/12/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import UIKit

class FilterDataViewController: UIViewController {

    //MARK:- IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK:- Properties
    var viewModel: FilterDataViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK:- UITableViewDataSource
extension FilterDataViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfData
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = viewModel.data(for: indexPath)
        let cell = FilterCellTableViewCell.instantiateFromNib(with: data)
        return cell
    }
}

//MARK:- UITableViewDelegate
//extension ArticlesListViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        viewModel.didSelectRow(at: indexPath)
//    }
//}


