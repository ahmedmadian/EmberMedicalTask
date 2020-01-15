//
//  DetailViewController.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/8/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    //MARK:- IBOutlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noContentImageView: UIView!
    
    // MARK: - Private Fields
     private var targetLookup: Lookup?
    
    // MARK:- ViewModel
    var viewModel: HomeViewModelType!
    
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
    
    // MARK: - Callbacks
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showLoader(with: "")
        self.loadData(with: targetLookup)
        setupNavigationBar(innerView: titleLabel)
        setupTableView()
        registerCells()
        noContentImageView.isHidden = true
    }
    
    // MARK:- Methods
    private func setupNavigationBar(innerView: UIView) {
        let width = self.view.frame.width
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: (self.navigationController?.navigationBar.frame.height)!))
        innerView.frame = CGRect(x: 0, y: 0, width: titleView.frame.width, height: titleView.frame.height)
        titleView.addSubview(innerView)
        self.navigationItem.titleView = titleView
        self.navigationItem.rightBarButtonItem = filterButton
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
    
    private func loadData(with: Lookup?) {
        viewModel.loadArticles(with: targetLookup) { (completed) in
            self.hideLoader()
            if completed {
                self.tableView.reloadData()
                self.noContentApperance()
            } else {
                self.showErrorMessage(text: self.viewModel.errorMessage)
            }
        }
    }
    
    @objc func refreshTableView() {
        showLoader(with: "")
        self.loadData(with: targetLookup)
    }
    
    private func noContentApperance() {
        self.noContentImageView.isHidden = self.viewModel.numberOfArticles > 0
    }
}

// MARK:- UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
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
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationItem.title = viewModel.sourceTitle(fot: indexPath)
        viewModel.didSelectRow(at: indexPath)
    }
}

// MARK:- FilterPopUpDelegate
extension HomeViewController: FilterPopUpDelegate {
    func dismissWith(data: Any?) {
        self.showLoader(with: "")
        guard let dataLookup = data as? Lookup else {return}
        targetLookup = dataLookup
        self.loadData(with: targetLookup)
    }
}
