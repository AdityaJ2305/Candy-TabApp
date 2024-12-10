import UIKit

class ProfileDetailViewController: UIViewController {
    private let ProfileName: String
    private let ProfileImageName: String

    private let imageView: UIImageView = {
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
            imageView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor, constant: -10),
            imageView.heightAnchor.constraint(
                lessThanOrEqualTo: view.heightAnchor, multiplier: 0.5),

            nameLabel.topAnchor.constraint(
                equalTo: imageView.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor, constant: -20),
            nameLabel.bottomAnchor.constraint(
                lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -20),
        ])
    }
}
