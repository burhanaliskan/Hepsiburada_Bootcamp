//
//  PermissionViewController.swift
//  iOS_Week_2
//
//  Created by Burhan Alışkan on 9.10.2021.
//

import UIKit

class PermissionViewController: BaseViewController<PermissionViewModel> {

    deinit {
         print("DEINIT PermissionViewController")
    }
        
    private var permissionView: PermissionMainView!
    
    override func prepareViewControllerSetup() {
        addPermissionView()
        subscribeViewModelListener()
    }
    
    private func addPermissionView() {
        permissionView = PermissionMainView(data: viewModel.getPermissionMainViewData())
        permissionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(permissionView)
        
        permissionView.anchor(leading: view.leadingAnchor,
                              bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
    
    private func subscribeViewModelListener() {
        viewModel.listenManagerActions { [weak self] in
            DispatchQueue.main.async {
                self?.dismiss(animated: true, completion: nil)
            }
        }
    }
}
