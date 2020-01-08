//
//  ArticlesListViewController.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/8/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

class ArticlesListViewController: BaseViewController, Storyboarded {

    // MARK:- Properties
    static var storyboardName: Storyboards { return .main}
    var viewModel: ArticlesListViewModel! = ArticlesListViewModel()
    let disposeBag = DisposeBag()
    lazy var refreshControl = UIRefreshControl()
   
    
    //MARK:- IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        registerCells()
        bindViewModel()
        setupNavigationItem()
    }
    
    // MARK:- Methods
    func setupNavigationItem(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: ArticleCell.typeName, bundle: Bundle.main), forCellReuseIdentifier: ArticleCell.typeName)
    }
    
    private func setupTableView() {
        tableView.estimatedRowHeight = 160
        tableView.addSubview(refreshControl)
    }
    
    override func hideLoader() {
        super.hideLoader()
        refreshControl.endRefreshing()
    }
    
    
    private func bindViewModel() {
        let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewDidAppear(_:)))
        .take(1)
        .mapToVoid()
        .asDriverOnErrorJustComplete()

        let pullToRefresh = refreshControl.rx
        .controlEvent(.valueChanged)
        .asDriver()
        
        let output = viewModel.transform(input: ArticlesListViewModel.Input(loadTrigger: Driver.merge(viewWillAppear, pullToRefresh)))
        
        output.loading.asObservable().subscribe(onNext: { (isLoading) in
            if isLoading {
                self.showLoader(with: "Loading..")
            } else {
                self.hideLoader()
            }
        }).disposed(by: disposeBag)
        
        output.error.asObservable().subscribe(onNext: { (error) in
            self.showErrorMessage(text: error.localizedDescription)
        }).disposed(by: disposeBag)
        
        output.title.drive(navigationItem.rx.title).disposed(by: disposeBag)
        
        output.articles.drive(tableView.rx.items(cellIdentifier: ArticleCell.typeName, cellType: ArticleCell.self)) { tableView, viewModel, cell in
            cell.config(with: viewModel)
        }.disposed(by: disposeBag)
    }
    
    
}
