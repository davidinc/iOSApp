import Foundation

/// Represents an individual team member's coffee order.
/// Conforms to `Identifiable` for dynamic iteration in SwiftUI lists.
struct CoffeeOrder: Identifiable, Codable {
    var id = UUID()
    var name: String
    var drink: String
    var size: String
    var sugar: Int
    var milk: Bool
    
    /// The remaining duration in seconds before the order is ready for pickup.
    var remainingSeconds: Int
}
