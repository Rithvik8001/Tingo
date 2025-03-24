
import Foundation

struct ItemModel: Identifiable,Codable {
	let title: String
	let isCompleted: Bool
	let id: String
	
	init(id:String = UUID().uuidString, title: String, isCompleted: Bool) {
		self.id = id
		self.title = title
		self.isCompleted = isCompleted
	}
	
	func updateCompletion() -> ItemModel {
		return ItemModel(id: id, title: title, isCompleted: !isCompleted)
	}
}

