//
//  PermissionMainViewComponent.swift
//  iOS_Week_2
//
//  Created by Burhan Alışkan on 9.10.2021.
//

import UIKit

class PermissionMainView: GenericBaseView<PermissionMainViewData> {
    
    deinit {
         print("DEINIT PermissionMainView")
    }
    
    private lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.clipsToBounds = true
        temp.backgroundColor = .white
        return temp
    }()
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [permissionImageView, permissionInfoView, actionButtonModuleView])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.alignment = .center
        temp.distribution = .fill
        temp.axis = .vertical
        temp.spacing = 20
        return temp
    }()
    
    private lazy var permissionImageView: UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.contentMode = .scaleAspectFill
        return temp
    }()
    
    private lazy var permissionInfoView: LabelPackView = {
        let temp = LabelPackView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var actionButtonModuleView: ActionButtonModuleView = {
        let temp = ActionButtonModuleView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addUserComponents()
    }
    
    override func setupViewConfigurations() {
        super.setupViewConfigurations()
        setupConteinerViewLayers()
    }
    
    private func addUserComponents() {
        addSubview(containerView)
        containerView.addSubview(mainStackView)
        
        
        containerView.anchor(top: topAnchor, leading: leadingAnchor,
                             bottom: bottomAnchor, trailing: trailingAnchor)
        
        mainStackView.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor,
                             bottom: containerView.bottomAnchor, trailing: containerView.trailingAnchor,
                             padding: .init(top: 40, left: 0, bottom: -60, right: 0))
    }
    
    private func setupConteinerViewLayers() {
        containerView.layer.cornerRadius = 10
        containerView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    override func loadDataView() {
        super.loadDataView()
        guard let data = returnData() else { return }
        permissionInfoView.setData(value: data.labelPackViewData)
        actionButtonModuleView.setData(value: data.actionButtonModuleViewData)
        permissionImageView.image = data.image
    }
}

