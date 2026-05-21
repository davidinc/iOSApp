//
//  OrderListView.swift
//  iOSApp
//
//  Created by Dawit Chernet on 2026-05-21.
//

import SwiftUI

struct OrderListView: View {
    @State private var orders = SampleOrders.orders
    
    var body: some View {
        NavigationStack {
            List(orders) { order in
                VStack(alignment: .leading) {
                    Text(order.name)
                        .font(.headline)
                    
                    Text("\(order.size) \(order.drink)")
                        .foregroundColor(.secondary)
                }
            }
            .navigationTitle("Orders")
        }
    }
}

#Preview {
    OrderListView()
}
