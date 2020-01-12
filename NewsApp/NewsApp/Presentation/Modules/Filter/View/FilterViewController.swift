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

class FilterViewController: BaseViewController {
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var exitButton: UIButton!

    @IBOutlet weak var cancelButton: UIButton!
    var viewModel: FilterViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containerView.makeRoundedCorners(with: 20)
        bindViewModel()
    }
    
    private func bindViewModel() {
        let input = FilterViewModel.Input(exitTrigger: Driver.merge(exitButton.rx.tap.asDriver(), cancelButton.rx.tap.asDriver()))
        let output = viewModel.transform(input: input)
        
        output.exitTriggered.drive().disposed(by: disposeBag)
    }
}
