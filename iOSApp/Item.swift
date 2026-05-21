//
//  Item.swift
//  iOSApp
//
//  Created by Dawit Chernet on 2026-05-21.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
