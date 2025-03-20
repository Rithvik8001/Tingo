
import SwiftUI

struct ListView: View {
	
	@State var todoItems: [ItemModel] = [
		ItemModel(title: "This is First Todo" , isCompleted: false),
		ItemModel(title: "This is Second Todo" , isCompleted: true),
		ItemModel(title: "This is Third Todo" , isCompleted: false),
		ItemModel(title: "This is Four Todo" , isCompleted: true)
	]
	
    var body: some View {
			NavigationStack {
				List {
					ForEach(todoItems) { todo in
						ListRowView(item: todo)
					}
				}
				.listStyle(InsetGroupedListStyle())
				.navigationTitle("Todos")
				.navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: AddTodoView()))
			}
    }
}

#Preview {
	NavigationStack {
		ListView()
	}
    
}
