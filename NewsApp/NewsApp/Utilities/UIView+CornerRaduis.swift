//
//  UIView+CornerRaduis.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/8/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import UIKit
extension UIView {
    func makeRoundedCorners(with avg: CGFloat) {
        layer.cornerRadius = self.frame.height / avg
    }
}
