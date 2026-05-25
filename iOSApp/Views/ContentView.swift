import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            OrderListView()
                .tabItem {
                    Label("Orders", systemImage: "list.bullet")
                }
            
            AddOrderView()
                .tabItem {
                    Label("Add Order", systemImage: "plus.circle.fill")
                }
            
            ExerciseView()
                .tabItem {
                    Label("Timer", systemImage: "clock.fill")
                }
        }
        .accentColor(.red)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
        .environmentObject(OrderStore())
}
