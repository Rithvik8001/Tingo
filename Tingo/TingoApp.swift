
import SwiftUI

@main
struct TingoApp: App {
	
	@StateObject var listViewModel: ListViewModel = ListViewModel()
	
	var body: some Scene {
		WindowGroup {
			NavigationStack {
				ListView()
			}
			.environmentObject(listViewModel)
		}
	}
}
