import UIKit

class ViewController: UIViewController {
	
	private let tableView: UITableView = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.backgroundColor = .systemBackground
		$0.register(PhotoCell.self, forCellReuseIdentifier: "cell")
		$0.rowHeight = UITableView.automaticDimension
		$0.estimatedRowHeight = 300
		return $0
	}(UITableView())
	
	private let viewModels = Array(1...50).map {i in ViewModel(i) }

	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.addSubview(tableView)
		setUpTable()
		addConstraints()
	}
	
	private func setUpTable() {
		tableView.delegate = self
		tableView.dataSource = self
		tableView.prefetchDataSource = self
	}
	
	private func addConstraints() {
		NSLayoutConstraint.activate([
			tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			tableView.topAnchor.constraint(equalTo: view.topAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
		])
	}
}

extension ViewController: UITableViewDataSource, UITableViewDelegate, UITableViewDataSourcePrefetching {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModels.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PhotoCell
		cell.configure(with: viewModels[indexPath.row])
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return UITableView.automaticDimension
	}
	
	func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
		return 300
	}
	
	func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
		for indexPath in indexPaths {
			let viewModel = viewModels[indexPath.row]
			viewModel.downloadImage(completion: nil)
		}
	}

	
}
