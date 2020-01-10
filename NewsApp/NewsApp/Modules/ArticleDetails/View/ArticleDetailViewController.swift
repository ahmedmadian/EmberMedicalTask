//
//  ArticleDetailViewController.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/9/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ArticleDetailViewController: BaseViewController {

    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var sourceURLLabel: UILabel!
    
    var viewModel: ArticleDetailViewModel!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func bindViewModel() {
        let viewDidAppear = self.rx.sentMessage(#selector(UIViewController.viewDidAppear(_:)))
            .take(1)
            .mapToVoid()
            .asDriverOnErrorJustComplete()
        
        let output = viewModel.transform(input: ArticleDetailViewModel.Input(loadTrigger: viewDidAppear))
        
        output.headline.drive(headlineLabel.rx.text).disposed(by: disposeBag)
        output.author.drive(authorLabel.rx.text).disposed(by: disposeBag)
        output.content.drive(contentLabel.rx.text).disposed(by: disposeBag)
        output.sourceURL.drive(sourceURLLabel.rx.text).disposed(by: disposeBag)
    }
    
    
//    func config(article: ArticleViewModel) {
//        self.headlineLabel.text = viewModel.article.headline
//        self.authorLabel.text = viewModel.article.authorName
//        self.contentLabel.text = viewModel.article.articleDescription
//        self.sourceURLLabel.text = viewModel.article.authorName
//    }

}
