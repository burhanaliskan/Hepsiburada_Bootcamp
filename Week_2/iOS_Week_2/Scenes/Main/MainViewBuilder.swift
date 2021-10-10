//
//  MainViewBuilder.swift
//  iOS_Week_2
//
//  Created by Burhan Alışkan on 10.10.2021.
//

import UIKit

class MainViewBuilder {
    
    class func build() -> UIViewController {
        let manager = MainManager()

        let viewModel = MainViewModel(manager: manager)
        let viewController = MainViewController(viewModel: viewModel)
        return viewController
    }
}
