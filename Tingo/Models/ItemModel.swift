
import Foundation

struct ItemModel: Identifiable {
	let title: String
	let isCompleted: Bool
	let id: String = UUID().uuidString
}
