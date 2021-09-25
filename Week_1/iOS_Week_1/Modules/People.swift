//
//  MoviesData.swift
//  iOS_Week_1
//
//  Created by Burhan Alışkan on 21.09.2021.
//

import Foundation

class People {
    let name: String
    let surname: String
    
    init(name: String, surname: String) {
        self.name = name
        self.surname = surname
    }
    
    func hello() {
        print("Hello, I'm \(name) \(surname)")
    }
    
    func setTeam(with value: Team) {
        print("\(name) \(surname) from \(value.teamName)")
        print("\(value.teamName) is a club from \(value.country)")
    }
}
