
import Foundation

class ListViewModel: ObservableObject {
	
	@Published var todoItems: [ItemModel] = [] {
		didSet {
			saveItems()
		}
	}
	
	let todoItemsKey: String = "todoItems_list"
	
	
	
	init() {
		getItems()
	}
	
	func getItems() {
		guard
			let data = UserDefaults.standard.data(forKey: todoItemsKey),
			let decodedData = try? JSONDecoder().decode([ItemModel].self, from: data)
		else {return}
		
		self.todoItems = decodedData
	}
	
	func deleteTodo(indexSet: IndexSet) {
		todoItems.remove(atOffsets: indexSet)
	}
	
	func moveTodo(from: IndexSet, to: Int){
		todoItems.move(fromOffsets: from, toOffset: to)
	}
	
	func addTodo(title:String) {
		let newItem = ItemModel(title: title, isCompleted: false)
		todoItems.append(newItem)
	}
	
	func todoComplete(item: ItemModel) {
		if let index = todoItems.firstIndex(where: {$0.id == item.id}) {
			todoItems[index] = item.updateCompletion()
		}
	}
	
	func saveItems() {
		if let encodedData = try? JSONEncoder().encode(todoItems) {
			UserDefaults.standard.set(encodedData, forKey: todoItemsKey)
		}
	}
}
