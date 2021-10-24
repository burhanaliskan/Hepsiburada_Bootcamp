//
//  ItemTableViewCell.swift
//  iOS_Week_3
//
//  Created by Burhan Alışkan on 20.10.2021.
//

import UIKit

class ItemTableViewCell: BaseTableViewCell {
    
    private lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.clipsToBounds = true
        temp.backgroundColor = .white
        return temp
    }()
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [imageViewComponent, labelPackComponent])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.alignment = .center
        temp.distribution = .fill
        temp.axis = .horizontal
        temp.spacing = 20
        return temp
    }()
    
    private lazy var imageViewComponent: CustomImageViewComponent = {
        let temp = CustomImageViewComponent()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.anchor(size: .init(width: 50, height: 50))
        return temp
    }()
    
    private lazy var labelPackComponent: LabelPackView = {
        let temp = LabelPackView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorViews() {
        super.addMajorViews()
        addUserComponents()
    }
    
    private func addUserComponents() {
        contentView.addSubview(containerView)
        containerView.addSubview(mainStackView)
        
        containerView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor,
                             bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor)
        
        mainStackView.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor,
                             bottom: containerView.bottomAnchor, trailing: containerView.trailingAnchor,
                             padding: .init(top: 10, left: 10, bottom: -10, right: -10))
        
    }
    
    func setData(by value: GenericDataProtocol) {
        guard let data = value as? ItemTableViewCellData else {return}
        imageViewComponent.setData(componentData: data.imageData)
        labelPackComponent.setData(value: data.labelData)
    }
}
