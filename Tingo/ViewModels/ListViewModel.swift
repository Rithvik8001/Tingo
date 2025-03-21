
import Foundation

class ListViewModel: ObservableObject {
	
	@Published var todoItems: [ItemModel] = []
	
	init() {
		getItems()
	}
	
	func getItems() {
		let newItems = [
			ItemModel(title: "This is First Todo" , isCompleted: false),
			ItemModel(title: "This is Second Todo" , isCompleted: true),
			ItemModel(title: "This is Third Todo" , isCompleted: false),
			ItemModel(title: "This is Four Todo" , isCompleted: true)
		]
		todoItems.append(contentsOf: newItems)
		
	}
	func deleteTodo(indexSet: IndexSet) {
		todoItems.remove(atOffsets: indexSet)
	}
	
	func moveTodo(from: IndexSet, to: Int){
		todoItems.move(fromOffsets: from, toOffset: to)
	}
}
