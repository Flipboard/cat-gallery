import UIKit

class CatImageCell: UICollectionViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    //MARK: - Properties
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier,
                                        bundle: nil) }
    
    var cellViewModel: CatCellViewModel? {
        
        //Set Properties of the cell
        didSet {
            
            activityIndicator.startAnimating()

            cellViewModel?.getImage(id: cellViewModel!.id, completion: { success, image in

                self.activityIndicator.stopAnimating()
                
                if success {

                    self.imageView.image = image

                } else {
                    
                    self.imageView.image = UIImage(named: Constants.Error.PlaceholderImage)
                }
            })
        }
    }
    
    //MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        
        imageView.image = nil
        activityIndicator.stopAnimating()
    }
}
