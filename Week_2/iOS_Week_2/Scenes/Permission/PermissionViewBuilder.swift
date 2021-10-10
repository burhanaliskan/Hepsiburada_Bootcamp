//
//  PermissionViewBuilder.swift
//  iOS_Week_2
//
//  Created by Burhan Alışkan on 10.10.2021.
//

import Foundation
import UIKit

class PermissionViewBuilder  {
    
    class func build(with type: PermissionType) -> UIViewController {
        
        let manager = PermissionViewFactory.getManager(with: type)
        let viewModel = PermissionViewModel(manager: manager)
        
        return PermissionViewController(viewModel: viewModel)
    }
    
}
