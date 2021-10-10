//
//  MainViewData.swift
//  iOS_Week_2
//
//  Created by Burhan Alışkan on 9.10.2021.
//

import Foundation

class MainViewData {
    
    deinit {
         print("DEINIT MainViewData")
    }
    
    private(set) var cameraButtonData: ActionButtonViewData
    private(set) var photoButtonData: ActionButtonViewData
    
    init(cameraButtonData: ActionButtonViewData, photoButtonData: ActionButtonViewData) {
        self.cameraButtonData = cameraButtonData
        self.photoButtonData = photoButtonData
    }
}
