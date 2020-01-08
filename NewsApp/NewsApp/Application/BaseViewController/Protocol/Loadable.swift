//
//  Loadable.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/8/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation
import SwiftSpinner

protocol Loadable: class {
    func showLoader(with message:String)
    func hideLoader()
}

extension Loadable {
    
    func showLoader(with message: String) {
        SwiftSpinner.show(message)
    }
    
    func hideLoader() {
        SwiftSpinner.hide()
    }
}
