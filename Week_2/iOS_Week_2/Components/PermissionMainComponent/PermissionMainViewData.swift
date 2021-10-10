//
//  PermissionMainViewComponentData.swift
//  iOS_Week_2
//
//  Created by Burhan Alışkan on 9.10.2021.
//

import UIKit

class PermissionMainViewData {
    
    deinit {
         print("DEINIT PermissionMainViewData")
    }
    
    private(set) var actionButtonModuleViewData: ActionButtonModuleViewData
    private(set) var labelPackViewData: LabelPackViewData
    private(set) var image: UIImage
    
    init(actionButtonModuleViewData: ActionButtonModuleViewData, labelPackViewData: LabelPackViewData, image: UIImage) {
        self.actionButtonModuleViewData = actionButtonModuleViewData
        self.labelPackViewData = labelPackViewData
        self.image = image
    }
    
}
