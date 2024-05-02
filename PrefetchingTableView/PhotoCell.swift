import UIKit

class PhotoCell: UITableViewCell {
	
	private let photo: UIImageView = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.clipsToBounds = true
		$0.contentMode = .scaleAspectFill
		return $0
	}(UIImageView())
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		contentView.addSubview(photo)
		addConstraint()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		photo.image = nil
	}
	
	private func addConstraint() {
		NSLayoutConstraint.activate([
			photo.widthAnchor.constraint(equalToConstant: 300),
			photo.heightAnchor.constraint(equalToConstant: 300),
			photo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
			photo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
			photo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
			
		])
	}
	
	func configure(with viewModel: ViewModel) {
		viewModel.downloadImage { [weak self] image in
			self?.photo.image = image
		}
	}
}
