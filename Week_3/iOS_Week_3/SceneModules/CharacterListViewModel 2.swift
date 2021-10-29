//
//  CharacterListViewModel.swift
//  iOS_Week_3
//
//  Created by Burhan Alışkan on 18.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage

class CharacterListViewModel  {
    
    private var state: CharacterListStateBlock?
    
    init() {}
    
    func getCharacterList() {
        
        state?(.loading)
        
        fireApiCall { [weak self] result in
            switch result {
            case.success(let response):
                print(response)
            case.failure(let errorResponse):
                print(errorResponse)
            }
            self?.state?(.done)
        }
    }
    
    func subscribeState(completion: @escaping CharacterListStateBlock) {
        state = completion
    }
    
    private func fireApiCall(with completion: @escaping (Result<CharacterDataResponse, ErrorResponse>) -> Void) {
        
        do {
            let urlRequest = try MarvelCharactersApiServiceProvider().returnUrlRequest()
            APIManager.shared.executeRequest(urlRequest: urlRequest, completion: completion)
        } catch let error {
            print("error: \(error)")
        }
        
    }
    
}

extension CharacterListViewModel: ItemListProtocol {
    
    func getNumberOfSection() -> Int {
        return 0
    }
    
    func getNumberOfItem(in section: Int) -> Int {
        return 100
    }
    
    func getData(at index: Int) -> GenericDataProtocol? {
        return nil
    }
    
    
}
