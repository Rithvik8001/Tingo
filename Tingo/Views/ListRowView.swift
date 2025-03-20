

import SwiftUI

struct ListRowView: View {
	
	let item: ItemModel
	
	var body: some View {
		HStack(spacing: 12) {
			Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
				.foregroundStyle(item.isCompleted ? .green : .red)
			Text(item.title)
		}
		.padding(.vertical,7)
		.font(.title3)
	}
}

#Preview {
	let item1 = ItemModel(title: "This is First Todo", isCompleted: false)
	let item2 = ItemModel(title: "This is First Todo", isCompleted: false)
	
	Group {
		ListRowView(item: item1)
		ListRowView(item: item2)
	}
}
