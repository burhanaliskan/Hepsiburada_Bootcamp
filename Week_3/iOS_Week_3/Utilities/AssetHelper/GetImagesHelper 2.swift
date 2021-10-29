//
//  PermissionImages.swift
//  iOS_Week_2
//
//  Created by Burhan Alışkan on 9.10.2021.
//

import UIKit

enum GetImagesHelper: String, GenericValueProtocol {
    
    typealias Value = UIImage
    
    var value: UIImage {
        return UIImage(imageLiteralResourceName: rawValue)
    }
    
    case roundHome = "round_home"
    case roundFavorite = "round_favorite"
    case outlineHome = "outline_home"
    case outlineFavorite = "outline_favorite"
}
