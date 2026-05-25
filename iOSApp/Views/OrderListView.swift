import SwiftUI
import Combine

struct OrderListView: View {
    @EnvironmentObject var store: OrderStore
    
    // System clock trigger firing off updates every 1 second
    let systemTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
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
                            VStack(alignment: .leading, spacing: 10) {
                                HStack {
                                    Text(order.name)
                                        .font(.headline)
                                    Spacer()
                                    
                                    // Individual countdown badge
                                    HStack(spacing: 4) {
                                        Image(systemName: "clock")
                                        Text(formatTime(order.remainingSeconds))
                                    }
                                    .font(.caption.monospacedDigit())
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(order.remainingSeconds == 0 ? Color.red.opacity(0.15) : Color.orange.opacity(0.15))
                                    .foregroundColor(order.remainingSeconds == 0 ? .red : .orange)
                                    .cornerRadius(6)
                                }
                                
                                Text("Drink: \(order.size) \(order.drink)")
                                    .font(.subheadline)
                                
                                Text("Sugar: \(order.sugar)  •  \(order.milk ? "Milk Included" : "No Milk")")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                
                                Divider()
                                    .padding(.top, 2)
                                
                                // Explicit Cancel Order Action Button
                                Button(action: {
                                    permanentlyDelete(orderID: order.id)
                                }) {
                                    HStack {
                                        Spacer()
                                        Image(systemName: "trash")
                                        Text("Cancel Order")
                                        Spacer()
                                    }
                                    .font(.footnote)
                                    .bold()
                                    .foregroundColor(.red)
                                    .padding(.vertical, 8)
                                    .background(Color.red.opacity(0.08))
                                    .cornerRadius(8)
                                }
                                .buttonStyle(.borderless) // Prevents the whole list row from clicking at once
                            }
                            .padding(.vertical, 6)
                        }
                    }
                }
            }
            .navigationTitle("Coffee Orders")
            // Constantly updates countdown properties simultaneously on a 1-second system pass
            .onReceive(systemTimer) { _ in
                for index in store.orders.indices {
                    if store.orders[index].remainingSeconds > 0 {
                        store.orders[index].remainingSeconds -= 1
                    }
                }
            }
        }
    }
    
    // Explicit removal utility handler
    private func permanentlyDelete(orderID: UUID) {
        store.orders.removeAll { $0.id == orderID }
    }
    
    // Transforms pure integer seconds tracking into scannable Minute:Second readouts
    private func formatTime(_ totalSeconds: Int) -> String {
        if totalSeconds == 0 { return "Ready" }
        let mins = totalSeconds / 60
        let secs = totalSeconds % 60
        return String(format: "%02d:%02d", mins, secs)
    }
}

#Preview {
    OrderListView()
        .environmentObject(OrderStore())
}
