
import SwiftUI

struct ListView: View {
	
	@State var todoItems: [String] = [
		"This is todo item 1",
		"This is todo item 2",
		"This is todo item 3",
		"This is todo item 4"
	]
    var body: some View {
			NavigationStack {
				List {
					ForEach(todoItems, id: \.self) { todo in
						HStack {
							Image(systemName: "checkmark.circle")
							Text(todo)
						}
						.padding(.vertical,7)
					}
				}
				.navigationTitle("Todos")
				.navigationBarItems(leading: EditButton())
			}
			.frame(maxHeight: .infinity)
    }
}

#Preview {
	NavigationStack {
		ListView()
	}
    
}
