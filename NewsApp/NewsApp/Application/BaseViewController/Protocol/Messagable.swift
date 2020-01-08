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

extension Messagable {
    
    func showErrorMessage(text: String) {
        let view = MessageView.viewFromNib(layout: .cardView)
        view.configureTheme(Theme.error)
        view.configureDropShadow()
        let imageIcon = UIImage(named: "error")!
        view.button?.isHidden = true
        view.configureContent(title: "Error", body: text, iconImage: imageIcon)
        view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        var config = SwiftMessages.Config.init()
        config.presentationContext = .window(windowLevel: UIWindow.Level(rawValue: UIWindow.Level.normal.rawValue))
        SwiftMessages.show(config: config, view: view)
    }
    
    func showSuccessMessage(text: String) {
        let view = MessageView.viewFromNib(layout: .cardView)
        view.configureTheme(Theme.success, iconStyle: IconStyle.none)
        view.configureDropShadow()
        view.button?.isHidden = true
        let imageIcon = UIImage(named: "success")!
        view.configureContent(title: "Success", body: text, iconImage:imageIcon)
        view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        var config = SwiftMessages.Config.init()
        config.presentationContext = .window(windowLevel: UIWindow.Level(rawValue: UIWindow.Level.normal.rawValue))
        SwiftMessages.show(config: config, view: view)
    }
    
}
