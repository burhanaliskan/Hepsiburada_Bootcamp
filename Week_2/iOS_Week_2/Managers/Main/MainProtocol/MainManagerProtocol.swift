//
//  MainProtocol.swift
//  iOS_Week_2
//
//  Created by Burhan Alışkan on 10.10.2021.
//


import Foundation

protocol MainManagerProtocol {
        
    func getMainViewData(with cameraButtonListener: @escaping VoidCompletionBlock, with photoButtonListener: @escaping VoidCompletionBlock) -> MainViewData
    
}
