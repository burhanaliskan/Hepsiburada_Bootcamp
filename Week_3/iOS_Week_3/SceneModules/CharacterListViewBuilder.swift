//
//  CharacterListViewBuilder.swift
//  iOS_Week_3
//
//  Created by Burhan Alışkan on 18.10.2021.
//

import Foundation
import UIKit

class CharacterListViewBuilder {
    
    class func build() -> UIViewController {
        let characterListViewModel = CharacterListViewModel()
        let characterListViewController = CharacterListViewController(viewModel: characterListViewModel)
        return characterListViewController
    }
    
}
