//
//  CoffeeOrder.swift
//  iOSApp
//
//  Created by Dawit Chernet on 2026-05-21.
//

import Foundation

struct CoffeeOrder: Identifiable, Codable {
    var id = UUID()
    var name: String
    var drink: String
    var size: String
    var sugar: Int
    var milk: Bool
}
