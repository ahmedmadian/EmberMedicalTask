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


