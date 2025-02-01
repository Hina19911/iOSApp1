//
//  OrderMenu.swift
//  iOSApp1
//
//  Created by Maryam Hina on 2025-01-23.
//

/*import SwiftUI

struct OrderMenuView: View {
    let menuItems = ["Coffee", "Donut", "Bagel", "Muffin", "Sandwich"]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Friend's Order")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                List(menuItems, id: \.self) { item in
                    Text(item)
                }

                NavigationLink(destination: Text("Thank you for ordering!")) {
                    Text("Place Order")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.horizontal)
            }
            .padding()
            .navigationTitle("Order Menu")
        }
    }
}
struct OrderMenuView_Previews: PreviewProvider {
    static var previews: some View {
        OrderMenuView()
    }
}*/
import SwiftUI

struct OrderMenuView: View {
    private let menuItems = ["Coffee", "Donut", "Bagel", "Muffin", "Sandwich"]
    private let orderManager = OrderManager()  // OrderManager instance
    
    @State private var coffeeCount = 0
    @State private var donutCount = 0
    @State private var bagelCount = 0
    @State private var muffinCount = 0
    @State private var sandwichCount = 0
    @State private var lastOrder: String? = nil  // Track last order
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Friend's Order")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                List {
                    menuItemView(name: "Coffee", count: $coffeeCount)
                    menuItemView(name: "Donut", count: $donutCount)
                    menuItemView(name: "Bagel", count: $bagelCount)
                    menuItemView(name: "Muffin", count: $muffinCount)
                    menuItemView(name: "Sandwich", count: $sandwichCount)
                }
                
                // Display order summary
                let totalCost = OrderCalculator.calculateTotalPrice(
                    coffee: coffeeCount,
                    donut: donutCount,
                    bagel: bagelCount,
                    muffin: muffinCount,
                    sandwich: sandwichCount
                )
                
                if OrderCalculator.totalItems(coffee: coffeeCount, donut: donutCount, bagel: bagelCount, muffin: muffinCount, sandwich: sandwichCount) > 0 {
                    VStack {
                        Text("Your Order:")
                            .font(.headline)
                        
                        if coffeeCount > 0 { Text("\(coffeeCount) x Coffee") }
                        if donutCount > 0 { Text("\(donutCount) x Donut") }
                        if bagelCount > 0 { Text("\(bagelCount) x Bagel") }
                        if muffinCount > 0 { Text("\(muffinCount) x Muffin") }
                        if sandwichCount > 0 { Text("\(sandwichCount) x Sandwich") }
                        
                        Text("Total Cost: $\(totalCost, specifier: "%.2f")")  // Show total cost
                            .font(.headline)
                            .foregroundColor(.green)
                    }
                }
                
                // Place Order Button
                NavigationLink(destination: OrderSummaryView(
                    coffeeCount: coffeeCount,
                    donutCount: donutCount,
                    bagelCount: bagelCount,
                    muffinCount: muffinCount,
                    sandwichCount: sandwichCount,
                    totalCost: OrderCalculator.calculateTotalPrice(
                            coffee: coffeeCount,
                            donut: donutCount,
                            bagel: bagelCount,
                            muffin: muffinCount,
                            sandwich: sandwichCount
                        )
                )) {
                    Text("Place Order")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.horizontal)

                
                // Repeat Last Order Button
                if let lastOrder = lastOrder {
                    NavigationLink(destination: RepeatOrderView(lastOrder: lastOrder)) {
                        Text("Repeat Last Order")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal)
                }
            }
            .padding()
            .navigationTitle("Order Menu")
            .onAppear {
                lastOrder = orderManager.getLastOrder()  // Load last order
            }
        }
    }
    
    // Helper function to create menu items
    func menuItemView(name: String, count: Binding<Int>) -> some View {
        HStack {
            Image(name.lowercased())
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50) //Image sizing
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack(alignment: .leading) {
                Text(name)
                    .fontWeight(count.wrappedValue > 0 ? .bold : .regular)
                    .foregroundColor(count.wrappedValue > 0 ? .blue : .primary)
                
                Text("$\(OrderCalculator.prices[name, default: 0], specifier: "%.2f")") // Show price
                    .foregroundColor(.gray)
                    .font(.caption)
            }
            
            Spacer()
            
            Text("\(count.wrappedValue)")  // Show count
                .fontWeight(.bold)
                .foregroundColor(.gray)
            
            Button(action: {
                count.wrappedValue += 1  // Increment count
            }) {
                Image(systemName: "plus.circle.fill")
                    .foregroundColor(.green)
                    .font(.title2)
            }
        }
        .padding()
        .background(count.wrappedValue > 0 ? Color.yellow.opacity(0.3) : Color.clear) // Highlight when tapped
        .cornerRadius(10)
    }
}

    struct OrderMenuView_Previews: PreviewProvider {
        static var previews: some View {
            OrderMenuView()
        }
    }
