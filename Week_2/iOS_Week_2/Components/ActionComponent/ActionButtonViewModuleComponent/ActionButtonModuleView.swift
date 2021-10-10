//
//  ActionModule.swift
//  iOS_Week_2
//
//  Created by Burhan Alışkan on 25.09.2021.
//

import UIKit

class ActionButtonModuleView: GenericBaseView<ActionButtonModuleViewData> {
    
    deinit {
         print("DEINIT ACTIONMODULE")
    }
    
    private lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.clipsToBounds = true
        temp.backgroundColor = .white
        return temp
    }()
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [negativeButton, positiveButton])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.alignment = .center
        temp.distribution = .fill
        temp.axis = .horizontal
        temp.spacing = 20
        return temp
    }()
    
    private lazy var negativeButton: ActionButtonView = {
        let temp = ActionButtonView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.anchor(size: .init(width: 120, height: 40))
        return temp
    }()
    
    private lazy var positiveButton: ActionButtonView = {
        let temp = ActionButtonView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.anchor(size: .init(width: 120, height: 40))
        return temp
    }()
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addUserComponents()
    }
    
    private func addUserComponents() {
        addSubview(containerView)
        containerView.addSubview(mainStackView)
        
        containerView.anchor(top: topAnchor, leading: leadingAnchor,
                             bottom: bottomAnchor, trailing: trailingAnchor)
        
        mainStackView.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor,
                             bottom: containerView.bottomAnchor, trailing: containerView.trailingAnchor,
                             padding: .init(top: 10, left: 10, bottom: -10, right: -10))
        
    }
    
    override func loadDataView() {
        super.loadDataView()
        guard let data = returnData() else { return }
        negativeButton.setData(value: data.negativeButtonData)
        positiveButton.setData(value: data.positiveButtonData)
    }
    
}
