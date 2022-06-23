import UIKit
import Foundation

class CatViewModel {
    
    //MARK: - Properties
    var reloadCollectionView: (() -> Void)?
    var cats = [Cat]()
    var catCellViewModels = [CatCellViewModel]() {
        didSet {
            reloadCollectionView?()
        }
    }
    
//    let networkManager:NetworkManager = NetworkManager()
    
    init() {
        
    }
    
    //MARK: - Helpers
    func getCats(tag:String) {
        
        NetworkManager().getCats(tag:tag, completion: { success, model, error in
            
            if success, let cats = model{
                
                self.fetchData(cats: cats)
            
            } else {
            
                print(error!)
            }
        })
    }
    
    func fetchData(cats:[Cat]) {
        
        //Loop through our items and create a new list of the cell's view model
        self.cats = cats
        var vms = [CatCellViewModel]()
        
        for cat in cats {
            
            vms.append(createCellModel(cat:cat))
        }
        catCellViewModels = vms
    }
    
    func createCellModel(cat:Cat) -> CatCellViewModel {
        
        //populate and returns cell view model
        return CatCellViewModel(id: cat.id)
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> CatCellViewModel {
            
        //return cell view model for the current indexpath
        return catCellViewModels[indexPath.row]
    }
    
//    func cancelImageDownloads() {
//
//        for vms in catCellViewModels {
//            
//            vms.cancelDownloads()
//        }
//    }
}
