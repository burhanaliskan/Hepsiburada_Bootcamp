//
//  LabelPackViewComponent.swift
//  iOS_Week_2
//
//  Created by Burhan Alışkan on 9.10.2021.
//

import UIKit

class LabelPackView: GenericBaseView<LabelPackViewData> {
    
    deinit {
         print("DEINIT LabelPackView")
    }
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.alignment = .center
        temp.distribution = .fill
        temp.axis = .vertical
        temp.spacing = 10
        return temp
    }()
    
    private lazy var titleLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textColor = .black
        temp.text = " "
        temp.lineBreakMode = .byWordWrapping
        temp.numberOfLines = 0
        temp.font = FontManager.robotoBold(24).value
        return temp
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textColor = .black
        temp.text = " "
        temp.lineBreakMode = .byWordWrapping
        temp.numberOfLines = 0
        temp.textAlignment = .center
        temp.font = FontManager.robotoLight(16).value
        return temp
    }()
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addUserComponents()
    }
    
    private func addUserComponents() {
        addSubview(mainStackView)
        
        mainStackView.anchor(top: topAnchor, leading: leadingAnchor,
                             bottom: bottomAnchor, trailing: trailingAnchor,
                             padding: .init(top: 10, left: 10, bottom: -10, right: -10))
        
    }
    
    override func loadDataView() {
        super.loadDataView()
        guard let data = returnData() else { return }
        titleLabel.text = data.title
        subTitleLabel.text = data.subTitle
    }
}
