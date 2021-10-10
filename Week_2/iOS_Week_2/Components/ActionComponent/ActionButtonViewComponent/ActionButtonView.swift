//
//  ActionButton.swift
//  iOS_Week_2
//
//  Created by Burhan Alışkan on 25.09.2021.
//

import UIKit
class ActionButtonView: GenericBaseView<ActionButtonViewData> {
    
    deinit {
         print("DEINIT ACTIONBUTTON")
    }
    
    private lazy var shadowContainerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.layer.shadowColor = UIColor.black.cgColor
        temp.layer.shadowOffset = CGSize(width: 0, height: 2)
        temp.layer.shadowRadius = 4
        temp.layer.shadowOpacity = 0.4
        temp.layer.cornerRadius = 6
        return temp
    }()
    
    private lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.layer.cornerRadius = 6
        temp.clipsToBounds = true
        return temp
    }()
    
    private lazy var titleLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = FontManager.robotoBlackItalic(15).value
        temp.contentMode = .center
        temp.textAlignment = .center
        return temp
    }()
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addContainerView()
    }
    
    override func setupViewConfigurations() {
        super.setupViewConfigurations()
        addTapGesture()
    }
    
    override func loadDataView() {
        super.loadDataView()
        guard let data = returnData() else {return}
        
        titleLabel.text = data.text
        switch data.buttonType {
        case .filled(let theme):
            containerView.backgroundColor = theme.value
            titleLabel.textColor = .white
        case .outlined(let theme):
            containerView.layer.borderWidth = 1
            containerView.layer.borderColor = theme.value.cgColor
            containerView.backgroundColor = .white
            titleLabel.textColor = theme.value
        }
    }
    
    private func addContainerView() {
        addSubview(shadowContainerView)
        shadowContainerView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        
        shadowContainerView.anchor(top: topAnchor, leading: leadingAnchor,
                             bottom: bottomAnchor, trailing: trailingAnchor)
        
        containerView.anchor(top: shadowContainerView.topAnchor, leading: shadowContainerView.leadingAnchor,
                             bottom: shadowContainerView.bottomAnchor, trailing: shadowContainerView.trailingAnchor)
        
        titleLabel.anchor(centerX: containerView.centerXAnchor, centerY: containerView.centerYAnchor)
    }
    
    private func pressedButtonAction() {
        guard let data = returnData() else { return }
        data.actionButtonListener?()
    }
    
}

// MARK: - UIGestureRecognizerDelegate
extension ActionButtonView: UIGestureRecognizerDelegate {
    
    private func addTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: .buttonTappedSelector)
        tap.delegate = self
        addGestureRecognizer(tap)
    }
    
    @objc fileprivate func buttonTapped(_ sender: UITapGestureRecognizer) {
        isUserInteractionEnabled = false
        startTappedAnimation { [weak self] finish in
            if finish {
                self?.isUserInteractionEnabled = true
                self?.pressedButtonAction()
            }
        }
    }
    
}

fileprivate extension Selector {
    static let buttonTappedSelector = #selector(ActionButtonView.buttonTapped)
}
