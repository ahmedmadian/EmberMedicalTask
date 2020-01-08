//
//  Storyboarded.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/8/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import UIKit

protocol Storyboarded {
    static var storyboardName: Storyboards {get}
    static var storyboardID: String {get}
    static func instantiate() -> UIViewController
}

extension Storyboarded {
    
    static var storyboardID: String {
        return String(describing: self)
    }
    
    static func instantiate() -> UIViewController {
        let storyboard = UIStoryboard(name: self.storyboardName.rawValue, bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(identifier: self.storyboardID)
        return vc
    }
}
