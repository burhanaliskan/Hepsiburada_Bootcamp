//
//  MainViewModel.swift
//  iOS_Week_2
//
//  Created by Burhan Alışkan on 10.10.2021.
//

import Foundation

class MainViewModel {
    
    private let manager: MainManagerProtocol

    private var cameraButtonListener: BooleanBlock?
    private var photoButtonListener: BooleanBlock?
    
    private let cameraPermissionManager = PermissionViewFactory.getCameraPermissioManager()
    private let photoPermissionManager = PermissionViewFactory.getPhotoPermissionManager()
    
    init(manager: MainManagerProtocol) {
        self.manager = manager
    }
    
    func listenCameraActions(with completion: @escaping BooleanBlock) {
        cameraButtonListener = completion
    }
    
    func listenPhotoActions(with completion: @escaping BooleanBlock) {
        photoButtonListener = completion
    }
    
    func getMainViewData() -> MainViewData {
        return manager.getMainViewData(with: cameraActionButtonHandler, with: photoActionButtonHandler)
    }

    private lazy var cameraActionButtonHandler = { [weak self] in
        print("Camera")
        self?.cameraButtonListener?((self?.cameraPermissionManager.checkPermission())!)
    }
    
    private lazy var photoActionButtonHandler = { [weak self] in
        print("Photo")
        self?.photoButtonListener?((self?.photoPermissionManager.checkPhotosPermission())!)
    }

}
