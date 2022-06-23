import UIKit

class TagsViewController: UITableViewController {

    //MARK: - Properties
    
    var tagArray:[String] = []
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        initTableView()
    }

    override func viewWillAppear(_ animated: Bool) {

        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
        
        getTags()
    }

    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
    }
    
    //MARK: - Helpers
    func getTags(){
        
        NetworkManager().getAllTags(completion: { success, array, error in
            
            if success{
                
                self.tagArray = array!
            
                DispatchQueue.main.async {
                    
                    self.tableView.reloadData()
                }
            } else {
                
                print(error!)
            }
        })
    }
    
    func initTableView(){
        
        initAutoLayout()
        
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        tableView.separatorColor = .darkGray
        
        tableView.backgroundColor = .black
        tableView.register(TagTableViewHeader.self,
                           forHeaderFooterViewReuseIdentifier: Constants.TagView.TagViewHeaderId)
        
        tableView.register(TagTableViewCell.self,
                           forCellReuseIdentifier: Constants.TagView.TagViewCellId)
    }

    func initAutoLayout() {

        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    //MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView,
                            heightForHeaderInSection section: Int) -> CGFloat {

        return Constants.TagView.TagViewHeaderHeight
    }
        
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {

        return tagArray.count
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TagView.TagViewCellId,
                                                 for: indexPath) as! TagTableViewCell
        
        cell.textLabel?.textColor = .white
        cell.textLabel?.text = tagArray[indexPath.row]
        
        return cell
    }

    //MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView,
                            heightForRowAt indexPath: IndexPath) -> CGFloat {

        return Constants.TagView.TagViewRowHeight
    }
    
    override func tableView(_ tableView: UITableView,
                            viewForHeaderInSection section: Int) -> UIView? {

        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: Constants.TagView.TagViewHeaderId) as! TagTableViewHeader
        
        header.titleLabel.textColor = .white
        header.titleLabel.text = Constants.TagView.TagViewTitle
        
        return header
    }
    
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        
        
        
        let vc = ImagesViewController()
        vc.tag = tagArray[indexPath.row]
        
        let nc = UINavigationController(rootViewController: vc)
//        self.navigationController!.pushViewController(navigationController, animated: true)
        
        present(nc, animated: true)
    }
}
