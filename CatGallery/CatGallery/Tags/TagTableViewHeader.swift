//
//  TagTableViewHeader.swift
//  CatGallery
//
//  Created by dh on 6/22/22.
//

import Foundation
import UIKit

class TagTableViewHeader: UITableViewHeaderFooterView {

    //MARK: Properties
    let titleLabel:UILabel = UILabel()
    
    //MARK: - initializers
    override init(reuseIdentifier: String?) {
        
        super.init(reuseIdentifier: reuseIdentifier)

        configureContents()
    }

    required init?(coder aDecoder: NSCoder) {
        
        fatalError(Constants.Error.InitFatal)
    }
    
    //MARK: - Helpers
    func configureContents(){
        
        contentView.backgroundColor = .black
        contentView.addSubview(titleLabel)
        
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                                    titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)])
        
    }
}
