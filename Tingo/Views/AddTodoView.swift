
import SwiftUI

struct AddTodoView: View {
	
	@State var todoInput: String = ""
	
    var body: some View {
			NavigationStack {
				ScrollView {
					TodoUiView(todoInput: $todoInput)
				}
				.navigationTitle("Add Todos 🐧")
			}
		}
}

#Preview {
	NavigationStack {
		AddTodoView()
	}
}

struct TodoUiView: View {
	
	@Binding var todoInput: String
	
	var body: some View {
		VStack() {
			TextField("Type your todo..", text: $todoInput)
				.padding()
				.frame(maxWidth: .infinity)
				.background(Color.white)
				.overlay(
					RoundedRectangle(cornerRadius: 14)
						.stroke(Color.gray.opacity(0.4), lineWidth: 1.7)
				)
				.shadow(color: Color.black.opacity(0.02), radius: 4, x: 0, y: 2) // Soft shadow
				.padding()
			
			Button {
				
			} label: {
				Text("Add Todo")
					.padding(.vertical,14)
					.padding(.horizontal,32)
					.background(.black)
					.foregroundStyle(.white)
					.bold()
					.cornerRadius(8)
			}
			.padding(.horizontal,16)
			
		}
	}
}
