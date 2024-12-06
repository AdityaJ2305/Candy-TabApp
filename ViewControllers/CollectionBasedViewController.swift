import UIKit

class CollectionBasedViewController: UIViewController {
    var collectionView: UICollectionView!
    
    private func setupUI() {
           let layout = UICollectionViewFlowLayout()
           layout.minimumLineSpacing = 10
           layout.minimumInteritemSpacing = 10
           let screenWidth = view.frame.width
           let itemWidth = (screenWidth - 20) / 2
           layout.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.2)
        
           collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
           collectionView.backgroundColor = .systemBackground
           collectionView.dataSource = self
           collectionView.delegate = self

           collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)

           view.addSubview(collectionView)
        
           collectionView.translatesAutoresizingMaskIntoConstraints = false
        
           NSLayoutConstraint.activate([
               collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
               collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
               collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
               collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
           ])
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Collection"
//        self.view.backgroundColor = .systemBackground
        self.view.backgroundColor = .white
        setupUI()
    }
   
}
extension CollectionBasedViewController: UICollectionViewDataSource, UICollectionViewDelegate {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return candies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
        let candy = candies[indexPath.item]
        cell.configure(with: candy.imageName, and: candy.name)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailView = ProfileDetailViewController(
            ProfileName: candies[indexPath.item].name,
            ProfileImageName: candies[indexPath.item].imageName)
        navigationController?.pushViewController(detailView, animated: true)
    }
}
