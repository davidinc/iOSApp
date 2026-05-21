//
//  SampleOrder.swift
//  iOSApp
//
//  Created by Dawit Chernet on 2026-05-21.
//

import Foundation

struct SampleOrders {
    static let orders = [
        CoffeeOrder(
            name: "Dawit",
            drink: "Coffee",
            size: "Large",
            sugar: 2,
            milk: true
        ),
        
        CoffeeOrder(
            name: "John",
            drink: "French Vanilla",
            size: "Medium",
            sugar: 1,
            milk: false
        )
    ]
}
