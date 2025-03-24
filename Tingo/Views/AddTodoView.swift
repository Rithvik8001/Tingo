import SwiftUI

struct AddTodoView: View {
	@State var todoInput: String = ""
	@State private var isAnimating = false
	@Environment(\.presentationMode) var presentationMode
	
	@EnvironmentObject var listViewModel: ListViewModel
	
	var body: some View {
		NavigationStack {
			ScrollView {
				VStack(spacing: 15) {
					HStack {
						TextField("Type your todo...", text: $todoInput)
							.font(.system(size: 16, weight: .regular, design: .rounded))
							.foregroundColor(.primary)
						
						if !todoInput.isEmpty {
							Button(action: {
								todoInput = ""
							}) {
								Image(systemName: "xmark.circle.fill")
									.foregroundColor(.gray)
									.opacity(0.7)
							}
						}
					}
					.padding(.vertical, 16)
					.padding(.horizontal, 14)
					.background(
						RoundedRectangle(cornerRadius: 16)
							.fill(Color.white)
					)
					.overlay(
						RoundedRectangle(cornerRadius: 16)
							.stroke(Color.primary.opacity(0.1), lineWidth: 1)
					)
					.shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 4)
					.padding(.horizontal, 20)
					.padding(.top, 30)
					
					// button with text and icon
					Button {
						withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
							isAnimating = true
							
							// Reset animation state after delay
							DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
								isAnimating = false
							}
							
							addTodoFunction()
						}
					} label: {
						HStack(spacing: 12) {
							Image(systemName: "sparkles")
								.font(.system(size: 16, weight: .semibold))
							
							Text("Create Task")
								.font(.system(size: 16, weight: .semibold, design: .rounded))
						}
						.frame(maxWidth: .infinity)
						.padding(.vertical, 18)
						.background(
							ZStack {
								RoundedRectangle(cornerRadius: 16)
									.fill(Color.black)
								
								RoundedRectangle(cornerRadius: 16)
									.stroke(Color.white.opacity(0.2), lineWidth: 1)
									.blur(radius: 0.5)
							}
						)
						.foregroundColor(.white)
						.shadow(color: Color.black.opacity(0.15), radius: 8, x: 0, y: 4)
						.scaleEffect(isAnimating ? 0.95 : 1)
					}
					.padding(.horizontal, 20)
					Spacer()
				}
				.frame(maxWidth: .infinity, maxHeight: .infinity)
				.background(Color(.systemGray6))
				
			}
			.navigationTitle("Tasks ✨")
			.background(Color(.systemGray6))
		}
	}
	
	func addTodoFunction() {
		listViewModel.addTodo(title: todoInput)
		presentationMode.wrappedValue.dismiss()
	}
	
}

#Preview {
	NavigationStack {
		AddTodoView()
	}
	.environmentObject(ListViewModel())
}
