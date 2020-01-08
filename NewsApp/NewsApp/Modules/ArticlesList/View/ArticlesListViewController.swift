//
//  ArticlesListViewController.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/8/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import UIKit

class ArticlesListViewController: BaseViewController, Storyboarded {

    static var storyboardName: Storyboards { return .main}
    
    //MARK:- IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: ArticleCell.typeName, bundle: Bundle.main), forCellReuseIdentifier: ArticleCell.typeName)
    }
    
}
