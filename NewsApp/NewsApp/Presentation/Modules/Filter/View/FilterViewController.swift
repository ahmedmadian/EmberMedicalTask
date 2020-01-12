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
    
    
    //MARK:- IBOutlet
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    //MARK:- Properties
    var viewModel: FilterViewModel!
    
    //MARK:- Callbacks
    override func viewDidLoad() {
        super.viewDidLoad()
        containerView.makeRoundedCorners(with: 20)
    }
    
    //MARK:- IBAction
    @IBAction func cancel_Tapped(_ sende: UIButton) {
        viewModel.dismiss()
    }
    
}
