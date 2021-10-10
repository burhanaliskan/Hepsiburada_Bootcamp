//
//  CameraPermissionManagerProtocol.swift
//  iOS_Week_2
//
//  Created by Burhan Alışkan on 10.10.2021.
//

import Foundation

protocol CameraPermissionManagerProtocol: PermissionManagerProtocol {
    
    func checkPermission() -> Bool

}
