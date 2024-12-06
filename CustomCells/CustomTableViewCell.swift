import UIKit

class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "CustomTableViewCell"
    
    private let ImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.tintColor = .label
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let NameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.lineBreakMode = .byTruncatingMiddle
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupUI() {
        contentView.addSubview(ImageView)
        contentView.addSubview(NameLabel)

        NSLayoutConstraint.activate([
            NameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            NameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            NameLabel.trailingAnchor.constraint(lessThanOrEqualTo: ImageView.leadingAnchor, constant: -8),
            
            ImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            ImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ImageView.widthAnchor.constraint(equalToConstant: 70),
            ImageView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with imageName: String, and label: String) {
        self.ImageView.image = UIImage(named: imageName)
        self.NameLabel.text = label
    }
}
