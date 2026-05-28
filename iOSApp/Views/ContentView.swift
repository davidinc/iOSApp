import SwiftUI

/// The root navigation interface for the application, handling tab-based routing.
struct ContentView: View {
    // Tracks the currently active tab to allow programmatic navigation
    @State private var selectedTab = 0
    
    var body: some View {
        TabView {
            OrderListView()
                .tabItem {
                    Label("Orders", systemImage: "list.bullet")
                }
                .tag(0) // Tags map to the selectedTab integer
            
            AddOrderView(selectedTab: $selectedTab)
                .tabItem {
                    Label("Add Order", systemImage: "plus.circle.fill")
                }
                .tag(1)
            
            ExerciseView()
                .tabItem {
                    Label("Timer", systemImage: "clock.fill")
                }
                .tag(2)
        }
        .tint(.red)
    }
}

#Preview {
    ContentView()
        .environmentObject(OrderStore())
}
