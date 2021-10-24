//
//  MainTabBarBuilder.swift
//  iOS_Week_3
//
//  Created by Burhan Alışkan on 13.10.2021.
//

import UIKit

class MainTabBarBuilder {
    
    class func build() -> UIViewController {
        let mainViewController = MainViewBuilder.build()
        let favoriteViewController = FavoriteViewBuilder.build()
        let tabViewController = MainTabBarController()
        tabViewController.viewControllers = [mainViewController, favoriteViewController]
        tabViewController.tabBar.backgroundColor = .systemBackground
        tabViewController.tabBar.tintColor = .black
        return tabViewController
    }
}
