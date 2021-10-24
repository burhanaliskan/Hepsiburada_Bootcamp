//
//  CharacterListViewController.swift
//  iOS_Week_3
//
//  Created by Burhan Alışkan on 18.10.2021.
//

import UIKit

class CharacterListViewController: BaseViewController<CharacterListViewModel> {

    private var mainComponent: ItemListView!
    
    override func prepareViewControllerSetup() {
        super.prepareViewControllerSetup()
        addMainComponent()
        subscribeViewModelListeners()
        viewModel.getCharacterList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func addMainComponent() {
        mainComponent = ItemListView()
        mainComponent.translatesAutoresizingMaskIntoConstraints = false
        mainComponent.delegate = viewModel
        view.addSubview(mainComponent)
        
        mainComponent.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
    
    private func subscribeViewModelListeners() {
        viewModel.subscribeState { [weak self] state in
            switch state {
            case .done:
                print("Data is ready")
            case .loading:
                print("Data is loading")
            }
        }
    }

}
