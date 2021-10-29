//
//  CharacterListViewState.swift
//  iOS_Week_3
//
//  Created by Burhan Alışkan on 24.10.2021.
//

import Foundation

typealias CharacterListStateBlock = (CharacterListViewState) -> Void

enum CharacterListViewState {
    
    case loading
    case done
}
