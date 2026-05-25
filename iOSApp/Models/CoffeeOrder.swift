import Foundation

struct CoffeeOrder: Identifiable {
    var id = UUID()
    var name: String
    var drink: String
    var size: String
    var sugar: Int
    var milk: Bool
    var pickupTime: String
}
