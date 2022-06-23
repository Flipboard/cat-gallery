//
//  TagTableViewCell.swift
//  CatGallery
//
//  Created by dh on 6/22/22.
//

import UIKit

class TagTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.backgroundColor = .black
        textLabel?.textColor = .white
    }

    required init?(coder aDecoder: NSCoder) {
     
        fatalError(Constants.Error.InitFatal)
    }
}
