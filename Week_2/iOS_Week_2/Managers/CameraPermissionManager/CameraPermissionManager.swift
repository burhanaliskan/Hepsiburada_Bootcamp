//
//  CameraPermissionManager.swift
//  iOS_Week_2
//
//  Created by Burhan Alışkan on 10.10.2021.
//

import Foundation
import Combine
import AVFoundation

class CameraPermissionManager: CameraPermissionManagerProtocol {
    
    func getPermissionMainViewData(with negativeListener: @escaping VoidCompletionBlock, with positiveListener: @escaping VoidCompletionBlock) -> PermissionMainViewData {
        
        let negativeButtonData = ActionButtonViewData(text: Localizables.permissonNotNow.value, buttonType: .outlined(.smooth)).setActionButtonListener(by: negativeListener)
        
        let positiveButtonData = ActionButtonViewData(text: Localizables.permissionOk.value, buttonType: .filled(.smooth)).setActionButtonListener(by: positiveListener)
        
        return PermissionMainViewData(actionButtonModuleViewData: ActionButtonModuleViewData(negativeButtonData: negativeButtonData, positiveButtonData: positiveButtonData), labelPackViewData: LabelPackViewData(title: Localizables.cameraPermissionTitle.value, subtTitle: Localizables.cameraPermissionSubTitle.value ), image: PermissionImages.camera.value)
    }
    
    func checkPermission() -> Bool {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            return true
        default:
            return false
        }
    }
    
    func requestPermission(with completion: @escaping VoidCompletionBlock) {
        print("\(#function) : CameraPermissionManager")
        AVCaptureDevice.requestAccess(for: .video) { granted in
            print("CAMERA PERMISSION GRANTED : \(granted)")
            completion()
        }
    }
    
}
