//
//  FilterViewController.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/9/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class FilterViewController: BaseViewController,Storyboarded {
    static var storyboardName: Storyboards {return .main}
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var exitButton: UIButton!

    var viewModel: FilterViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    private func bindViewModel() {
        let input = FilterViewModel.Input(exitTrigger: exitButton.rx.tap.asDriver())
        let output = viewModel.transform(input: input)
        
        output.exitTriggered.drive().disposed(by: disposeBag)
    }
}
