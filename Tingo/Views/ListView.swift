
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
						.listRowSeparator(.hidden)
						.listRowBackground(Color.clear)
						.listRowInsets(
							EdgeInsets(
								top: 6,
								leading: 10,
								bottom: 6,
								trailing: 10
							)
						)
				}
			}
			.listStyle(PlainListStyle())
			.background(Color(.systemGray6))
			.scrollContentBackground(.hidden)
			.navigationTitle("Tasks ✨")
			.navigationBarItems(
				leading: EditButton()
					.font(.system(size: 20,design: .rounded)),
				trailing: NavigationLink(destination: AddTodoView()) {
					HStack{
						Text("Add")
						Image(systemName: "sparkles")
							.font(.system(size: 20, weight: .semibold))
					}
				}
			)
		}
	}
}

#Preview {
	NavigationStack {
		ListView()
	}
	
}
