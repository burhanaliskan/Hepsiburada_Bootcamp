//
//  ItemTableViewCellData.swift
//  iOS_Week_3
//
//  Created by Burhan Alışkan on 20.10.2021.
//

import Foundation

class ItemTableViewCellData: GenericDataProtocol {
    
    private(set) var imageData: CustomImageViewComponentData
    private(set) var labelData: LabelPackViewData
    
    init(imageData: CustomImageViewComponentData, labelData: LabelPackViewData) {
        self.imageData = imageData
        self.labelData = labelData
    }
}
