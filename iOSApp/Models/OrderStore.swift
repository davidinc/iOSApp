import Foundation
import Combine

class OrderStore: ObservableObject {
    @Published var orders: [CoffeeOrder] = [
        CoffeeOrder(
            name: "Dawit",
            drink: "Coffee",
            size: "Large",
            sugar: 2,
            milk: true,
            remainingSeconds: 600), // 10 mins
        CoffeeOrder(
            name: "John",
            drink: "French Vanilla",
            size: "Medium",
            sugar: 1,
            milk: false,
            remainingSeconds: 900) // 15 mins
    ]
    
    // Shared initial baseline default value for new entries
    @Published var globalDefaultMinutes: Int = 10
}
