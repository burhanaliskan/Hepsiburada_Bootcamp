//
//  PermissionLocalizables.swift
//  iOS_Week_2
//
//  Created by Burhan Alışkan on 10.10.2021.
//

import Foundation

enum Localizables: String, GenericValueProtocol {
    
    typealias Value = String
    
    var value: String {
        return rawValue.toLocalize()
    }
    
    case cameraPermissionTitle = "cameraPermissionTitle"
    case cameraPermissionSubTitle = "cameraPermissionSubTitle"

    case photoPermissionTitle = "photoPermissionTitle"
    case photoPermissionSubTitle = "photoPermissionSubTitle"

    case permissionOk = "permissionOk"
    case permissonNotNow = "permissonNotNow"
    
    case camera = "camera"
    case photo = "photo"
    
}
