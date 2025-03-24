
import SwiftUI

struct ListView: View {
	
	@EnvironmentObject var listViewModel: ListViewModel
	
	var body: some View {
		NavigationStack {
			List {
				ForEach(listViewModel.todoItems) { todo in
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
						.onTapGesture {
							withAnimation(.easeInOut(duration: 0.4)) {
								listViewModel.todoComplete(item: todo)
							}
						}
				}
				.onDelete { IndexSet in
					listViewModel.deleteTodo(indexSet: IndexSet)
				}
				.onMove { IndexSet, Int in
					listViewModel.moveTodo(from: IndexSet, to: Int)
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
	.environmentObject(ListViewModel())
	
}
