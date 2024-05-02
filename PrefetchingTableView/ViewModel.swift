import UIKit

class ViewModel {
	var myNumber: Int
	init(_ number: Int) {
		myNumber = number
	}
	private var isDownLoading = false
	private var cachedImage: UIImage?
	private var callback: ((UIImage?) -> Void)?
	
	func downloadImage(completion: ((UIImage?) -> Void)?) {
		if let image = cachedImage {
			completion?(image)
			return
		}
		
		guard !isDownLoading else {
			self.callback = completion
			return
		}
		isDownLoading = true
		guard let url = URL(string:"https://robohash.org/set_set\(myNumber)/?size=500x500") else { return }
		
		let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, _ in
			guard let data else { return }
			DispatchQueue.main.async {
				let image = UIImage(data: data)
				self?.cachedImage = image
				self?.callback?(image)
				self?.callback = nil
				completion?(image)
			}
		}
		task.resume()
	}
	
}
