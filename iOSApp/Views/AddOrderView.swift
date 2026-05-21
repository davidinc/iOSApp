//
//  AddOrderView.swift
//  iOSApp
//
//  Created by Dawit Chernet on 2026-05-21.
//

import SwiftUI

struct AddOrderView: View {
    @State private var name = ""
    @State private var drink = "Coffee"
    @State private var size = "Medium"
    @State private var sugar = 1
    @State private var milk = false
    
    let drinks = ["Coffee", "French Vanilla", "Latte", "Tea"]
    let sizes = ["Small", "Medium", "Large"]
    
    var body: some View {
        Form {
            Section(header: Text("Customer")) {
                TextField("Name", text: $name)
            }
            
            Section(header: Text("Order")) {
                Picker("Drink", selection: $drink) {
                    ForEach(drinks, id: \.self) {
                        Text($0)
                    }
                }
                
                Picker("Size", selection: $size) {
                    ForEach(sizes, id: \.self) {
                        Text($0)
                    }
                }
                
                Stepper("Sugar: \(sugar)", value: $sugar, in: 0...5)
                
                Toggle("Milk", isOn: $milk)
            }
            
            Button("Save Order") {
                // Save logic will be added later
            }
        }
        .navigationTitle("Add Order")
    }
}

#Preview {
    AddOrderView()
}
