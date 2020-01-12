//
//  ArticlesListViewController.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/8/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import UIKit

class ArticlesListViewController: BaseViewController {

    //MARK:- IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK:- Properties
    var viewModel: ArticlesListViewModel!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Runtime Views
    lazy var refreshControl: UIRefreshControl = {
       let controller = UIRefreshControl()
        controller.backgroundColor =  #colorLiteral(red: 0.6682028062, green: 0.6682028062, blue: 0.6682028062, alpha: 1)
        return controller
    }()
    
    lazy var filterButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(named: "filter") , style: .plain, target: self, action: #selector(startFiltering))
        return button
    }()
    
    //MARK: - Callbacks
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showLoader(with: "Loading")
        viewModel.loadArticles { (succeed) in
            self.hideLoader()
            if succeed {
                self.tableView.reloadData()
            } else {
               
            }
        }
        setupNavigationBar(title: viewModel.title)
        setupTableView()
        registerCells()
        setupNavigationItem()
        self.navigationItem.rightBarButtonItem = filterButton
    }
    
   
    
    // MARK:- Methods
    func setupNavigationBar(title: String) {
        let width = self.view.frame.width
        
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: (self.navigationController?.navigationBar.frame.height)!))
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: titleView.frame.width, height: titleView.frame.height))
        
        titleLabel.text = title
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleView.addSubview(titleLabel)
        
        navigationItem.titleView = titleView
    }
    
    func setupNavigationItem(){
        self.navigationItem.title = viewModel.title
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: ArticleCell.typeName, bundle: Bundle.main), forCellReuseIdentifier: ArticleCell.typeName)
    }
    
    
    private func setupTableView() {
        tableView.addSubview(refreshControl)
    }
    
    override func hideLoader() {
        super.hideLoader()
        refreshControl.endRefreshing()
    }
    
    @objc func startFiltering() {
        viewModel.didLaunchFilterView()
    }
}

// MARK:- UITableViewDataSource
extension ArticlesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfArticles
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = viewModel.article(for: indexPath)
        let cell = ArticleCell.instantiateFromNib(with: data)
        return cell
    }
}

//MARK:- UITableViewDelegate
extension ArticlesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRow(at: indexPath)
    }
}

