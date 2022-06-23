//
//  Constants.swift
//  CatGallery
//
//  Created by dh on 6/22/22.
//

import Foundation
import UIKit

enum Constants{
    
    enum MainView {
        static let Btntitle:String = "See some cats!"
    }
    
    enum TagView {
        static let TagViewTitle:String = "Tags"
        static let TagViewHeaderId:String = "TagViewHeaderId"
        static let TagViewCellId:String = "TagViewCellId"
        static let TagViewRowHeight:CGFloat = 44.0
        static let TagViewHeaderHeight:CGFloat = 60.0
        
    }
    
    enum ImageView{
        static let BlankString:String = ""
        static let BackBtnTitle:String = "Tags"
        static let CollectionViewCellWidth:CGFloat = 100.0
        static let CollectionViewCellHeight:CGFloat = 100.0
        static let CollectionViewEdgeInsets:CGFloat = 10.0
        static let CollectionViewMinimumLineSpacing:CGFloat = 4.0
        static let CollectionViewMinimumInteritemSpacing:CGFloat = 4.0
        static let ConstraintConst:CGFloat = 0.0
    }
    enum NetworkManager {
        static let BaseUrlString:String = "https://cataas.com"
        static let TagQuery:String = "?tags="
    }
    
    enum Error {
        
        static let ImageParse:String = "Error parsing data into image"
        static let JSONParse:String = "Json Parse Error"
        static let NoDataReturned:String = "No Data Returned"
        static let PlaceholderImage:String = "PlaceHolder"
        static let InitFatal:String = "init(coder:) has not been implemented"
        static let XibDoesNotExist:String = "xib does not exists"
    }
}
