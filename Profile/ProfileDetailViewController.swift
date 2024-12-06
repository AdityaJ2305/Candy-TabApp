import UIKit

class ProfileDetailViewController: UIViewController {
    private let ProfileName: String
    private let ProfileImageName: String
    
    private  let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let nameLabel: UILabel = {
        let nl = UILabel()
        nl.textColor = .label
        nl.textAlignment = .center
        nl.translatesAutoresizingMaskIntoConstraints = false
        return nl
    }()
    
    init(ProfileName: String, ProfileImageName: String) {
        self.ProfileName = ProfileName
        self.ProfileImageName = ProfileImageName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ProfileName
        self.imageView.image = UIImage(named: ProfileImageName)
        self.nameLabel.text = ProfileName
        self.view.backgroundColor = .systemBackground
        
        view.addSubview(imageView)
        view.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor , constant:  50),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant:  -20)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }
}
