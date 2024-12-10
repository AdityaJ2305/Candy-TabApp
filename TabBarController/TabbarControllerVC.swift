import UIKit

class TabbarControllerVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUITabBar()
    }

    private func configureUITabBar() {
        let vc1 = TableBasedViewController()
        let vc2 = CollectionBasedViewController()
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "sun.min.fill")
        vc1.tabBarItem.title = "TableView"
        vc2.tabBarItem.title = "CollectionView"

        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        
        self.tabBar.backgroundColor = .systemBackground
        self.tabBar.tintColor = .label
        self.viewControllers = [nav1, nav2]
    }
}
