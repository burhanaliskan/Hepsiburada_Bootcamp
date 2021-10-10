//
//  PhotosPermissionManagerProtocol.swift
//  iOS_Week_2
//
//  Created by Burhan Alışkan on 10.10.2021.
//

import Foundation
import PhotosUI
import Combine
import SwiftUI

protocol PhotosPermissionManagerProtocol: PermissionManagerProtocol {
    
    func checkPhotosPermission() -> Bool
    
    func subscribePhotosStatusObject(completion: @escaping BooleanBlock) -> AnyCancellable
    
    func selectPhoto(completion: @escaping (Image) -> Void)
}
