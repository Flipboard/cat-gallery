//
//  CatCellViewModel.swift
//  CatGallery
//
//  Created by dh on 6/22/22.
//

import Foundation
import UIKit

class CatCellViewModel:NSObject {
    
    var id:String
//    let networkManager:NetworkManager = NetworkManager()
    
    init (id:String) {
    
        self.id = id
    }
    
    func getImage(id:String, completion: @escaping(Bool, UIImage?) -> ()) {

        NetworkManager().getCatImage(id: id,
                                     completion: { success, img, error in
            
            if success {
                
                return completion(success, img)
            
            } else {
                
                print(error!)
                return completion(success, nil)
            }
        })
    }
    
//    func cancelDownloads() {
//        
//        networkManager.cancelDLTask()
//    }
}
