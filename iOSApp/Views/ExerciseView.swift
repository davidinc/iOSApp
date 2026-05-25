import SwiftUI

struct ExerciseView: View {
    @EnvironmentObject var store: OrderStore
    @State private var isTimerRunning = false
    @State private var timer: Timer? = nil
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            Image(systemName: isTimerRunning ? "hourglass.badge.plus" : "clock.fill")
                .font(.system(size: 90))
                .foregroundColor(store.orders.isEmpty ? .gray : .orange)
                .symbolEffect(.pulse, isActive: isTimerRunning)
            
            VStack(spacing: 8) {
                Text("Active Run Reminder")
                    .font(.title)
                    .bold()
                
                Text(store.orders.isEmpty ? "No active team runs to track." : "Tracking reminder countdown for \(store.orders.count) orders.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
            }
            
            // Dynamic value component linked straight to data repository state
            Text("\(store.globalPickupMinutes) Minutes")
                .font(.system(size: 48, weight: .bold, design: .monospaced))
                .foregroundColor(store.globalPickupMinutes <= 2 ? .red : .primary)
            
            if !isTimerRunning {
                Stepper("Adjust Run Window", value: $store.globalPickupMinutes, in: 1...60)
                    .padding(.horizontal, 40)
            }
            
            Button(action: toggleTimer) {
                Text(isTimerRunning ? "Pause Reminder" : "Start Run Countdown")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(store.orders.isEmpty ? Color.gray : (isTimerRunning ? Color.gray : Color.orange))
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.horizontal, 40)
            .disabled(store.orders.isEmpty)
            
            Spacer()
        }
        .padding()
        .onDisappear {
            stopTimer()
        }
    }
    
    private func toggleTimer() {
        if isTimerRunning {
            stopTimer()
        } else {
            startTimer()
        }
    }
    
    private func startTimer() {
        isTimerRunning = true
        // One second translates into a one-minute tick reduction for testing convenience
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if store.globalPickupMinutes > 0 {
                store.globalPickupMinutes -= 1
            } else {
                stopTimer()
            }
        }
    }
    
    private func stopTimer() {
        isTimerRunning = false
        timer?.invalidate()
        timer = nil
    }
}

#Preview {
    ExerciseView()
        .environmentObject(OrderStore())
}
