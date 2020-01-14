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
    private var targetLookup: Lookup?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Runtime Views
    lazy var refreshControl: UIRefreshControl = {
       let controller = UIRefreshControl()
        controller.backgroundColor =  #colorLiteral(red: 0.6682028062, green: 0.6682028062, blue: 0.6682028062, alpha: 1)
        controller.addTarget(self, action: #selector(refreshTableView), for: .valueChanged)
        return controller
    }()
    
    lazy var filterButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(named: "filter") , style: .plain, target: self, action: #selector(startFiltering))
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = viewModel.title
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    //MARK: - Callbacks
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showLoader(with: "")
        viewModel.loadArticles(with: targetLookup) { (succeed) in
            self.hideLoader()
            if succeed {
                self.tableView.reloadData()
            } else {
               
            }
        }
        setupNavigationBar(innerView: titleLabel)
        setupTableView()
        registerCells()
        self.navigationItem.rightBarButtonItem = filterButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK:- Methods
    func setupNavigationBar(innerView: UIView) {
        let width = self.view.frame.width
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: (self.navigationController?.navigationBar.frame.height)!))
        innerView.frame = CGRect(x: 0, y: 0, width: titleView.frame.width, height: titleView.frame.height)
        titleView.addSubview(innerView)
        navigationItem.titleView = titleView
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
    
    @objc func refreshTableView() {
        showLoader(with: "")
        viewModel.loadArticles(with: targetLookup) { (_) in
            self.hideLoader()
            self.tableView.reloadData()
        }
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

// MARK:- UITableViewDelegate
extension ArticlesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRow(at: indexPath)
    }
}

// MARK:- UITableViewDelegate

extension ArticlesListViewController: FilterPopUpDelegate {
    func dismissWith(data: Any?) {
        self.showLoader(with: "")
        guard let dataLookup = data as? Lookup else {return}
        targetLookup = dataLookup
        
        viewModel.loadArticles(with: targetLookup) { (_) in
            self.hideLoader()
            self.titleLabel.text = self.viewModel.title
            self.tableView.reloadData()
        }
    }
}
