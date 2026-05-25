import SwiftUI

struct ExerciseView: View {
    @EnvironmentObject var store: OrderStore
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            Image(systemName: store.orders.isEmpty ? "cup.and.saucer" : "clock.fill")
                .font(.system(size: 90))
                .foregroundColor(store.orders.isEmpty ? .gray : .orange)
            
            VStack(spacing: 8) {
                Text("Run Status Dashboard")
                    .font(.title)
                    .bold()
                
                Text(store.orders.isEmpty ? "All runs finished. No active items." : "Monitoring \(store.orders.count) active independent team timers.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
            }
            
            if !store.orders.isEmpty {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Live Overview Monitor:")
                        .font(.caption)
                        .bold()
                        .foregroundColor(.secondary)
                    
                    ForEach(store.orders) { order in
                        HStack {
                            Text(order.name)
                                .font(.body)
                            Spacer()
                            Text(formatTime(order.remainingSeconds))
                                .font(.body.monospacedDigit())
                                .bold()
                                .foregroundColor(order.remainingSeconds == 0 ? .red : .orange)
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(10)
                    }
                }
                .padding(.horizontal, 30)
            }
            
            Spacer()
        }
        .padding()
    }
    
    private func formatTime(_ totalSeconds: Int) -> String {
        if totalSeconds == 0 { return "Ready" }
        let mins = totalSeconds / 60
        let secs = totalSeconds % 60
        return String(format: "%02d:%02d", mins, secs)
    }
}

#Preview {
    ExerciseView()
        .environmentObject(OrderStore())
}
