import Foundation

// Tracks individual countdown durations natively in seconds
struct CoffeeOrder: Identifiable, Codable {
    var id = UUID()
    var name: String
    var drink: String
    var size: String
    var sugar: Int
    var milk: Bool
    var remainingSeconds: Int // Each order manages its own ticking timeline
}
