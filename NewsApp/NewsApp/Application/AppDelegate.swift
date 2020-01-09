//
//  AppDelegate.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/8/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    lazy var navigationController: UINavigationController = {
       let nav =  UINavigationController(rootViewController: ArticlesListViewController.instantiate())
        nav.navigationBar.backgroundColor = UIColor.black
        nav.navigationBar.barTintColor = UIColor.black
        nav.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.6682028062, green: 0.6682028062, blue: 0.6682028062, alpha: 1)]
//            self.navigationController?.navigationBar.tintColor = UIColor.blueColor()
        nav.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.666592598, green: 0.6667093039, blue: 0.666585207, alpha: 1)]
        return nav
    }()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        return true
    }


}

