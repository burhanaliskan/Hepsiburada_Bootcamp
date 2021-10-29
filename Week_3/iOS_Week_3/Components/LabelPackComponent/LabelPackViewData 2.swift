//
//  LabelPackViewComponentData.swift
//  iOS_Week_2
//
//  Created by Burhan Alışkan on 9.10.2021.
//

import Foundation

class LabelPackViewData {
    
    deinit {
         print("DEINIT LabelPackViewData")
    }
    
    private(set) var title: String
    private(set) var subTitle: String
    
    init(title: String, subtTitle: String) {
        self.title = title
        self.subTitle = subtTitle
    }
    
}
