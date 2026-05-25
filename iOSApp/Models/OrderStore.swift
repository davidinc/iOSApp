import Foundation
import Combine

// Central source of truth linking active orders and the reminder clock timer state
class OrderStore: ObservableObject {
    @Published var orders: [CoffeeOrder] = [
        CoffeeOrder(
            name: "Dawit",
            drink: "Coffee",
            size: "Large",
            sugar: 2,
            milk: true,
            pickupTime: "10 Mins"
        ),
        CoffeeOrder(
            name: "John",
            drink: "French Vanilla",
            size: "Medium",
            sugar: 1,
            milk: false,
            pickupTime: "10 Mins"
        )
    ]
    
    // Global shared parameter initialized to assignment default specification
    @Published var globalPickupMinutes: Int = 10
}
