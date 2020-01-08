//
//  Messagable.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/8/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation
import SwiftMessages

protocol Messagable: class {
    func showSuccessMessage(text: String)
    func showErrorMessage(text: String)
}
