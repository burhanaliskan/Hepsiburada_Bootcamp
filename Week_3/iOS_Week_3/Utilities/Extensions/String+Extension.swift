//
//  String+Extension.swift
//  iOS_Week_2
//
//  Created by Burhan Alışkan on 10.10.2021.
//

import Foundation

extension String {
    
    func toLocalize() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
