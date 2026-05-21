import SwiftUI

struct ContentView: View {
    @State private var orders = SampleOrders.orders
    
    var body: some View {
        NavigationStack {
            List(orders) { order in
                VStack(alignment: .leading) {
                    Text(order.name)
                        .font(.headline)
                    
                    Text("\(order.size) \(order.drink)")
                        .foregroundColor(.secondary)
                }
            }
            .navigationTitle("Tim Hortons Run")
        }
    }
}

#Preview {
    ContentView()
}
