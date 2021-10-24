//
//  BaseTableViewCell.swift
//  iOS_Week_3
//
//  Created by Burhan Alışkan on 20.10.2021.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addMajorViews()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addMajorViews()
        setupView()
    }
    
    func addMajorViews() {}
    func setupView() {}
    
    static var identifier: String {
        return String(describing: self)
    }
    
}
