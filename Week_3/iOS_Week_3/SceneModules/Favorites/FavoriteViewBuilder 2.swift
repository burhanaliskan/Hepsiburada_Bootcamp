//
//  FavoriteBuilder.swift
//  iOS_Week_3
//
//  Created by Burhan Alışkan on 13.10.2021.
//

import UIKit

class FavoriteViewBuilder {
    
    class func build() -> UIViewController {
        let favoriteViewModel = FavoriteViewModel()
        let favoriteViewController = FavoriteViewController(viewModel: favoriteViewModel)
        favoriteViewController.title = "Favorite"
        favoriteViewController.tabBarItem.image = UIImage(imageLiteralResourceName: GetImagesHelper.roundFavorite.rawValue)
        favoriteViewController.tabBarItem.selectedImage = UIImage(imageLiteralResourceName: GetImagesHelper.outlineFavorite.rawValue)
        return favoriteViewController
    }
    
}
