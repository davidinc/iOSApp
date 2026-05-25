import SwiftUI

struct OrderListView: View {
    @EnvironmentObject var store: OrderStore
    
    var body: some View {
        NavigationStack {
            Group {
                if store.orders.isEmpty {
                    VStack(spacing: 12) {
                        Image(systemName: "tray")
                            .font(.largeTitle)
                            .foregroundColor(.secondary)
                        Text("No active orders found")
                            .font(.headline)
                            .foregroundColor(.secondary)
                    }
                } else {
                    List {
                        ForEach(store.orders) { order in
                            VStack(alignment: .leading, spacing: 6) {
                                HStack {
                                    Text(order.name)
                                        .font(.headline)
                                    Spacer()
                                    
                                    // Live visualization block for synchronization parameter verification
                                    HStack(spacing: 4) {
                                        Image(systemName: "clock")
                                        Text(order.pickupTime)
                                    }
                                    .font(.caption)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(Color.orange.opacity(0.15))
                                    .foregroundColor(.orange)
                                    .cornerRadius(6)
                                }
                                
                                Text("Drink: \(order.size) \(order.drink)")
                                    .font(.subheadline)
                                
                                Text("Sugar: \(order.sugar)  •  \(order.milk ? "Milk Included" : "No Milk")")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
            .navigationTitle("Coffee Orders")
        }
    }
}

#Preview {
    OrderListView()
        .environmentObject(OrderStore())
}
