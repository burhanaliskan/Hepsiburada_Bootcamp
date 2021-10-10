//
//  PermissionViewModel.swift
//  iOS_Week_2
//
//  Created by Burhan Alışkan on 10.10.2021.
//

import Foundation


class PermissionViewModel {
    
    private let manager: PermissionManagerProtocol
    private var permissionviewDismissActionBlock: VoidCompletionBlock?
    
    
    init(manager: PermissionManagerProtocol) {
        self.manager = manager
    }
    
    func listenManagerActions(with completion: @escaping VoidCompletionBlock) {
        permissionviewDismissActionBlock = completion
    }
    
    func getPermissionMainViewData() -> PermissionMainViewData {
        return manager.getPermissionMainViewData(with: negativeListener, with: positiveListener)
    }
    
    private func permissionListenerHandler() {
        print("permissionListenerHandler tapped")
        guard let dismissBlock = permissionviewDismissActionBlock else { return }
        manager.requestPermission(with: dismissBlock)
    }


    private lazy var negativeListener = { [weak self] in
        print("Negative")
        self?.permissionviewDismissActionBlock?()
    }
    
    private lazy var positiveListener = { [weak self] in
        print("Positive")
        self?.permissionListenerHandler()
    }
}
