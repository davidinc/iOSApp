import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Spacer()
                
                Image(systemName: "cup.and.saucer.fill")
                    .font(.system(size: 100))
                    .foregroundColor(.red)
                
                Text("Tim Hortons Run")
                    .font(.system(size: 36, weight: .bold, design: .rounded))
                
                Text("Track your team's coffee orders dynamically and ensure they are picked up on time.")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                
                Spacer()
                
                NavigationLink(destination: ContentView()) {
                    Text("Start Ordering")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .shadow(color: .red.opacity(0.3), radius: 5, x: 0, y: 3)
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 20)
            }
        }
    }
}

#Preview {
    WelcomeView()
        .environmentObject(OrderStore())
}
