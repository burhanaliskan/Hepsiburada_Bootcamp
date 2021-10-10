//
//  MainManager.swift
//  iOS_Week_2
//
//  Created by Burhan Alışkan on 10.10.2021.
//

import Foundation

class MainManager: MainManagerProtocol {
    
    
    func getMainViewData(with cameraButtonListener: @escaping VoidCompletionBlock, with photoButtonListener: @escaping VoidCompletionBlock) -> MainViewData {
        
        let cameraButton = ActionButtonViewData(text: Localizables.camera.value, buttonType: .filled(.smooth)).setActionButtonListener(by: cameraButtonListener)
        
        let photoButton = ActionButtonViewData(text: Localizables.photo.value, buttonType: .filled(.bright)).setActionButtonListener(by: photoButtonListener)
        
        return MainViewData(cameraButtonData: cameraButton, photoButtonData: photoButton)
        
    }
}
