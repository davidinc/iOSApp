import SwiftUI

@main
struct iOSApp: App {
    
    @StateObject var store = OrderStore()
    
    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environmentObject(store)
        }
    }
}
