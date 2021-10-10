//
//  PhotoPermissionManager.swift
//  iOS_Week_2
//
//  Created by Burhan Alışkan on 10.10.2021.
//

import Foundation
import PhotosUI
import Combine
import SwiftUI

typealias BooleanBlock = (Bool) -> Void

class PhotoPermissionManager: NSObject, PhotosPermissionManagerProtocol, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    private let photosStatusSubject = PassthroughSubject<Bool, Never>()
    
    private let pickerController = UIImagePickerController()
    private var selectedImage: ((Image) -> Void)?
    
    override init() {
        super.init()
        pickerController.delegate = self
    }
    
    func subscribePhotosStatusObject(completion: @escaping BooleanBlock) -> AnyCancellable {
        return photosStatusSubject.sink(receiveValue: completion)
    }
    
    func requestPermission(with completion: @escaping VoidCompletionBlock) {
        print("\(#function) : PhotosPermissionManager")
        
        PHPhotoLibrary.requestAuthorization { status in
            print("photo access status : \(status)")
            self.handleRequestAuthorization(with: status)
            completion()
        }
    }
    
    func checkPhotosPermission() -> Bool {
        let status = PHPhotoLibrary.authorizationStatus()
        return (status == .authorized || status == .limited)
    }
    
    func selectPhoto(completion: @escaping (Image) -> Void) {
        selectedImage = completion
        guard let topMostViewController = UIApplication.topViewController() else { return }
        topMostViewController.present(pickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let tempImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        selectedImage?(Image(uiImage: tempImage))
        pickerController.dismiss(animated: true, completion: nil)
    }
    
    func getPermissionMainViewData(with negativeListener: @escaping VoidCompletionBlock, with positiveListener: @escaping VoidCompletionBlock) -> PermissionMainViewData {
        
        let negativeButtonData = ActionButtonViewData(text: Localizables.permissonNotNow.value, buttonType: .outlined(.bright)).setActionButtonListener(by: negativeListener)
        
        let positiveButtonData = ActionButtonViewData(text: Localizables.permissionOk.value, buttonType: .filled(.bright)).setActionButtonListener(by: positiveListener)
        
        return PermissionMainViewData(actionButtonModuleViewData: ActionButtonModuleViewData(negativeButtonData: negativeButtonData, positiveButtonData: positiveButtonData), labelPackViewData: LabelPackViewData(title: Localizables.photoPermissionTitle.value, subtTitle: Localizables.photoPermissionSubTitle.value ), image: PermissionImages.photo.value)
    }
    
    // MARK: - Private Methods -
    private func handleRequestAuthorization(with value: PHAuthorizationStatus) {
        photosStatusSubject.send((value == .authorized || value == .limited))
    }
    
}
