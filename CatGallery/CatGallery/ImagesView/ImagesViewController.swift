import UIKit

class ImagesViewController: UIViewController {
    
    //MARK: - Properties
    var collectionView: UICollectionView!
    var tag:String = Constants.ImageView.BlankString
    lazy var viewModel = {
        
        CatViewModel()
    }()
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {

        super.viewDidLoad()
        
        initView()
        initViewModel()
    }

    override func viewWillAppear(_ animated: Bool) {}

    override func viewDidAppear(_ animated: Bool) {}
    
    override func viewWillDisappear(_ animated: Bool) {}
    
    //MARK: - Helpers
    func initView() {
        
        initNavigationView()
        initCollectionView()
    }
    
    func initNavigationView(){
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .black
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        self.navigationController?.navigationBar.isTranslucent = false
        
        self.navigationController?.navigationBar.backgroundColor = .black
        
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: Constants.ImageView.BackBtnTitle,
                                                                style: .done,
                                                                target: self,
                                                                action: #selector(dismissView(_:)))
    }
    
    func initCollectionView() {
        
        let view = UIView()
        
        collectionView = UICollectionView(frame: self.view.frame,
                                          collectionViewLayout: createUICollectionFlowLayout())
        
        collectionView?.backgroundColor = UIColor.black
        collectionView?.dataSource = self
        collectionView?.delegate = self
 
        view.addSubview(collectionView ?? UICollectionView())

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor,
                                               constant: Constants.ImageView.ConstraintConst).isActive = true
        
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                 constant: Constants.ImageView.ConstraintConst).isActive = true

        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                constant: Constants.ImageView.ConstraintConst).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: view.topAnchor,
                                            constant: Constants.ImageView.ConstraintConst).isActive = true

        collectionView.register(CatImageCell.nib,
                                forCellWithReuseIdentifier: CatImageCell.identifier)
        
        self.view = view
    }
   
    func createUICollectionFlowLayout() -> UICollectionViewFlowLayout {
        
        //Configure UICollectionFlowLayout
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        
        layout.sectionInset = UIEdgeInsets(top: Constants.ImageView.CollectionViewEdgeInsets,
                                           left: Constants.ImageView.CollectionViewEdgeInsets,
                                           bottom: Constants.ImageView.CollectionViewEdgeInsets,
                                           right: Constants.ImageView.CollectionViewEdgeInsets)
        
        layout.itemSize = CGSize(width: Constants.ImageView.CollectionViewCellWidth,
                                 height: Constants.ImageView.CollectionViewCellHeight)
        
        layout.minimumLineSpacing = Constants.ImageView.CollectionViewMinimumLineSpacing
        layout.minimumInteritemSpacing = Constants.ImageView.CollectionViewMinimumInteritemSpacing

        return layout
    }
    
    func initViewModel() {
        
        viewModel.getCats(tag:tag)

        viewModel.reloadCollectionView = {[weak self] in

            DispatchQueue.main.async {

                self?.collectionView.reloadData()
            }
        }
    }
     
    //MARK: Actions
    @objc func dismissView(_ sender:Any) {
    
//        viewModel.cancelImageDownloads()
        
        self.navigationController!.dismiss(animated: true, completion: nil)
    }
}

//MARK: - UICollectionViewDataSource
extension ImagesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        viewModel.catCellViewModels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //Get cell
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatImageCell.identifier,
                                                            for: indexPath) as? CatImageCell else { fatalError(Constants.Error.XibDoesNotExist) }

        let cellVM = viewModel.getCellViewModel(at: indexPath)
        cell.cellViewModel = cellVM
        
        cell.layer.shouldRasterize = true;
        cell.layer.rasterizationScale = UIScreen.main.scale;
        
        return cell
    }
}

//MARK: - UICollectionViewDelegate
extension ImagesViewController: UICollectionViewDelegate {}

