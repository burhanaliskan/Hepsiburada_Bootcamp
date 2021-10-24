//
//  MainViewBuilder.swift
//  iOS_Week_3
//
//  Created by Burhan Alışkan on 10.10.2021.
//

import UIKit

class MainViewBuilder {
    
    class func build() -> UIViewController {
        let mainViewModel = MainViewModel()
        let mainViewController = MainViewController(viewModel: mainViewModel)
        let navigationViewControler = UINavigationController(rootViewController: mainViewController)
        configureView(mainViewController: mainViewController)
        return navigationViewControler
    }
    
     private static func configureView(mainViewController: UIViewController) {
        
        mainViewController.title = "Home"
        mainViewController.tabBarItem.image = UIImage(imageLiteralResourceName: GetImagesHelper.roundHome.rawValue)
        mainViewController.tabBarItem.selectedImage = UIImage(imageLiteralResourceName: GetImagesHelper.outlineHome.rawValue)
        mainViewController.navigationController?.setNavigationBarHidden(true, animated: false)
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBackground
        mainViewController.navigationController?.navigationBar.standardAppearance = appearance
        mainViewController.navigationController?.navigationBar.scrollEdgeAppearance = mainViewController.navigationController?.navigationBar.standardAppearance
        
    }
}
