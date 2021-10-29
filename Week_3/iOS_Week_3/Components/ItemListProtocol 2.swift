//
//  ItemListProtocol.swift
//  iOS_Week_3
//
//  Created by Burhan Alışkan on 20.10.2021.
//

import Foundation

protocol ItemListProtocol: AnyObject {
    
    func getNumberOfSection() -> Int
    func getNumberOfItem(in section: Int) -> Int
    func getData(at index: Int) -> GenericDataProtocol?
    
}
