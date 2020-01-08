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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showLoader(with: "Loading...")
    }


}
