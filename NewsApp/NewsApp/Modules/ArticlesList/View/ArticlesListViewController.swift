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
    var viewModel: ArticlesListViewModel!
    let disposeBag = DisposeBag()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    lazy var refreshControl: UIRefreshControl = {
       let controller = UIRefreshControl()
        controller.backgroundColor =  #colorLiteral(red: 0.6682028062, green: 0.6682028062, blue: 0.6682028062, alpha: 1)
        return controller
    }()
    
    var filterBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.style = .plain
        button.image = UIImage(named: "filter")
        return button
    }()
    
    //MARK:- IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFilterButton()
        setupTableView()
        registerCells()
        bindViewModel()
        setupNavigationItem()
    }
    
    // MARK:- Methods
    func setupNavigationItem(){
        navigationItem.largeTitleDisplayMode = .automatic
    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: ArticleCell.typeName, bundle: Bundle.main), forCellReuseIdentifier: ArticleCell.typeName)
    }
    
    func setupFilterButton() {
        self.navigationController?.navigationItem.rightBarButtonItem = filterBarButton
    }
    
    private func setupTableView() {
        tableView.addSubview(refreshControl)
    }
    
    override func hideLoader() {
        super.hideLoader()
        refreshControl.endRefreshing()
    }
    
    
    private func bindViewModel() {
        let viewDidAppear = self.rx.sentMessage(#selector(UIViewController.viewDidAppear(_:)))
        .take(1)
        .mapToVoid()
        .asDriverOnErrorJustComplete()

        let pullToRefresh = refreshControl.rx
        .controlEvent(.valueChanged)
        .asDriver()
        
        let didSelectRowAt = tableView.rx.modelSelected(ArticleViewModel.self).asDriverOnErrorJustComplete()
        
        let output = viewModel.transform(input: ArticlesListViewModel.Input(loadTrigger: Driver.merge(viewDidAppear, pullToRefresh), selectItem: didSelectRowAt))
        
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
