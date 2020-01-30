import UIKit

class ViewController: UIViewController {
  
  private let controllerView = UserView()

  private var users = [User]() {
    didSet {
      DispatchQueue.main.async {
        self.controllerView.collectionView.reloadData()
      }
    }
  }
  
  override func loadView() {
    view = controllerView
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()
      controllerView.collectionView.dataSource = self
      //controllerView.collectionView.delegate = self
      loadUsers()
      controllerView.collectionView.register(UINib(nibName: "collectionViewCell", bundle: nil), forCellWithReuseIdentifier: "userCell")
    }
  
  private func loadUsers() {
    UsersFetchingService.manager.getUsers { (result) in
      switch result {
      case .failure(let appErrpr):
        print("error: \(appErrpr)")
      case .success(let users):
        self.users = users
      }
    }
  }
}

extension ViewController : UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    users.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userCell", for: indexPath) as? UserCollectionViewCell else {
      fatalError("failed to deque cell")
    }
    let user = users[indexPath.row]
    cell.configureCell(user)
    
    return cell
  }
}

