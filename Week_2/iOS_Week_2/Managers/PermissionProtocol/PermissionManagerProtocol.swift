//
//  PermissionManagerProtocol.swift
//  iOS_Week_2
//
//  Created by Burhan Alışkan on 10.10.2021.
//

import Foundation

protocol PermissionManagerProtocol {
    
    func requestPermission(with completion: @escaping VoidCompletionBlock)
    
    func getPermissionMainViewData(with negativeListener: @escaping VoidCompletionBlock, with positiveListener: @escaping VoidCompletionBlock) -> PermissionMainViewData
    
}
