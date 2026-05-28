import SwiftUI

/// A form interface allowing users to input and submit new team coffee orders.
struct AddOrderView: View {
    @EnvironmentObject var store: OrderStore
    
    // Allows this view to force the TabView back to the main list upon saving
    @Binding var selectedTab: Int
    
    @State private var name = ""
    @State private var drink = "Coffee"
    @State private var size = "Medium"
    @State private var sugar = 1
    @State private var milk = false
    
    let drinks = ["Coffee", "French Vanilla", "Latte", "Tea"]
    let sizes = ["Small", "Medium", "Large"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Customer Information")) {
                    TextField("Enter Name", text: $name)
                        .autocorrectionDisabled()
                }
                
                Section(header: Text("Drink Selection")) {
                    Picker("Drink", selection: $drink) {
                        ForEach(drinks, id: \.self) { Text($0) }
                    }
                    
                    Picker("Size", selection: $size) {
                        ForEach(sizes, id: \.self) { Text($0) }
                    }
                    
                    Stepper("Sugar: \(sugar)", value: $sugar, in: 0...5)
                    
                    Toggle("Add Milk", isOn: $milk)
                }
                
                Section(header: Text("Pickup Window Setup")) {
                    Stepper(
                        "Pickup In: \(store.globalDefaultMinutes) Minutes",
                        value: $store.globalDefaultMinutes,
                        in: 1...60
                    )
                }
                
                Section {
                    Button("Save Order") {
                            saveOrder()
                    }
                            .frame(maxWidth: .infinity)
                            .bold()
                            .foregroundColor(name.isEmpty ? .secondary : .red)
                            .disabled(name.isEmpty)
                }
            }
            .navigationTitle("Add Order")
        }
    }
    
    private func saveOrder() {
        // Converted into seconds parameter storage (minutes * 60)
        let totalSeconds = store.globalDefaultMinutes * 60
        
        let newOrder = CoffeeOrder(
            name: name,
            drink: drink,
            size: size,
            sugar: sugar,
            milk: milk,
            remainingSeconds: totalSeconds
        )
        
        store.orders.append(newOrder)
        
        name = ""
        drink = "Coffee"
        size = "Medium"
        sugar = 1
        milk = false
        
        // Go back to Orders tab
        selectedTab = 0
    }
}

#Preview {
    AddOrderView(selectedTab: .constant(1))
        .environmentObject(OrderStore())
}
