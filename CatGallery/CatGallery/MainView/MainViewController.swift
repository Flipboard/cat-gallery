import UIKit

class MainViewController: UIViewController {
    
    //MARK: - Properties
    lazy var showCatsButton: UIButton = {
        
        return initBtn()
    }()

    //MARK: - LifeCycle
    override func viewDidLoad() {

        super.viewDidLoad()
        
        initView()
    }

    override func viewWillAppear(_ animated: Bool) {}

    override func viewDidAppear(_ animated: Bool) {}
    
    //MARK: - Actions
    @objc func btnAction(_ sender:Any) {
        
        let vc = TagsViewController()
        present(vc, animated: true)
    }
    
    //MARK: - Helpers
    func initBtn() -> UIButton {
        
        let button = UIButton(type: .custom)
        
        button.setTitle(Constants.MainView.Btntitle,
                        for: .normal)
        
        button.addTarget(self,
                         action: #selector(btnAction(_:)),
                         for: .allEvents)
        return button
    }
    
    func initView(){
        
        view.addSubview(showCatsButton)
        
        showCatsButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([showCatsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     showCatsButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
    }
}


