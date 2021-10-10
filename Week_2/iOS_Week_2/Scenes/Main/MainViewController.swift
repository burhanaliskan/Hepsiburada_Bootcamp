//
//  ViewController.swift
//  iOS_Week_2
//
//  Created by Burhan Alışkan on 25.09.2021.
//

import UIKit

class MainViewController: BaseViewController<MainViewModel> {

    deinit {
         print("DEINIT MAINVIEWCONTROLLER")
    }
        
    private var mainView: MainView!
    
    override func prepareViewControllerSetup() {
        super.prepareViewControllerSetup()
        addMainView()
        actionButtonPress()
    }
    
    private func addMainView() {
        mainView = MainView(data: viewModel.getMainViewData())
        view.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        
        mainView.anchor(top: view.topAnchor ,centerX: view.centerXAnchor,
                        padding: .init(top: 100, left: 0, bottom: 0, right: 0))
    }
    
    private func actionButtonPress() {
        cameraButtonPress()
        photoButtonPress()
    }
    
    private func cameraButtonPress() {
        viewModel.listenCameraActions { granted in
            granted ? (print("CAMERA GRANTED TO OPEN")) : self.firePermissionRequestView(with: .camera)
        }
    }
    
    private func photoButtonPress() {
        viewModel.listenPhotoActions { granted in
            granted ? (print("PHOTOS GRANTED TO OPEN")) : self.firePermissionRequestView(with: .photo)
        }
    }
    
    private func firePermissionRequestView(with type: PermissionType) {
        present(PermissionViewBuilder.build(with: type), animated: true) {
            print("PERMISSION VIEW HAS JUST PRESENTED")
        }
    }
    
}

