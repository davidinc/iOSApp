import SwiftUI

@main
struct iOSApp: App {
    // Single global context reference tracking source-of-truth updates
    @StateObject private var orderStore = OrderStore()
    
    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environmentObject(orderStore) // Spreads context reference explicitly down UI path
        }
    }
}
