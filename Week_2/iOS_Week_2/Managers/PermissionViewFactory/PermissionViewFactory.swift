//
//  PermissionViewFactory.swift
//  iOS_Week_2
//
//  Created by Burhan Alışkan on 10.10.2021.
//

import Foundation

class PermissionViewFactory {
    
    private static let cameraManager = CameraPermissionManager()
    private static let photoManager = PhotoPermissionManager()
    
    class func getManager(with type: PermissionType) -> PermissionManagerProtocol {
        switch type {
        case .camera:
            return CameraPermissionManager()
        case .photo:
            return PhotoPermissionManager()
        }
    }
    
    class func getCameraPermissioManager() -> CameraPermissionManagerProtocol {
        return cameraManager
    }
    
    class func getPhotoPermissionManager() -> PhotosPermissionManagerProtocol {
        return photoManager
    }
}
