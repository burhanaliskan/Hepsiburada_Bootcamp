//
//  ActionModuleData.swift
//  iOS_Week_2
//
//  Created by Burhan Alışkan on 25.09.2021.
//

import Foundation

class ActionButtonModuleViewData {
    
    deinit {
         print("DEINIT ACTIONMODULEDATA")
    }
    
    private(set) var negativeButtonData: ActionButtonViewData
    private(set) var positiveButtonData: ActionButtonViewData
    
    init(negativeButtonData: ActionButtonViewData, positiveButtonData: ActionButtonViewData) {
        self.negativeButtonData = negativeButtonData
        self.positiveButtonData = positiveButtonData
    }
    
}
