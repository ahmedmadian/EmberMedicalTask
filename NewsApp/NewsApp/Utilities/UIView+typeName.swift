//
//  UIView+typeName.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/8/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import UIKit

extension UIView {
    
    static var typeName: String {
        return String(describing: self)
    }
}
