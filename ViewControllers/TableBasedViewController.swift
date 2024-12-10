import UIKit

class TableBasedViewController: UIViewController {

    private let tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .systemBackground
        tv.allowsSelection = true
        tv.register(
            CustomTableViewCell.self,
            forCellReuseIdentifier: CustomTableViewCell.identifier)
        tv.rowHeight = 80
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()

    private func setupUI() {
        self.navigationItem.title = "Table"
        self.view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor),
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

}

extension TableBasedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int
    {
        return candies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell
    {
        let cell =
            tableView.dequeueReusableCell(
                withIdentifier: CustomTableViewCell.identifier, for: indexPath)
            as! CustomTableViewCell
        let image = candies[indexPath.row].imageName
        let label = candies[indexPath.row].name
        cell.configure(with: image, and: label)
        return cell
    }
    
    func tableView(
        _ tableView: UITableView, didSelectRowAt indexPath: IndexPath
    ) {
        let detailView = ProfileDetailViewController(
            ProfileName: candies[indexPath.row].name,
            ProfileImageName: candies[indexPath.row].imageName)
        navigationController?.pushViewController(detailView, animated: true)
//        navigationController?.performSegue(withIdentifier: String, sender: <#T##Any?#>)
    }
}
