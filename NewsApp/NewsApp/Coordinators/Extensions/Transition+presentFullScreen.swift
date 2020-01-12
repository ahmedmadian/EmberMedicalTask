//
//  Transition+presentFullScreen.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/9/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import UIKit
import XCoordinator

extension Transition {

    static func presentOverCurrentContext(_ presentable: Presentable, animation: Animation? = nil) -> Transition {
        presentable.viewController?.modalPresentationStyle = .overCurrentContext
        return .present(presentable, animation: animation)
    }
    
}
