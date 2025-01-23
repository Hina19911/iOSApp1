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
    let menuItems = ["Coffee", "Donut", "Bagel", "Muffin", "Sandwich"]
    private let orderManager = OrderManager()  // Instantiate OrderManage
    @State private var lastOrder: String? = nil  // State variable to track the last order
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Friend's Order")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                List(menuItems, id: \.self) { item in
                    Text(item)
                        .onTapGesture {
                            lastOrder = item  // Update the last order when an item is tapped
                        }
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
                
                // Button to repeat the last order
                if let lastOrder = lastOrder {
                    Button(action: {
                        print("Repeating last order: \(lastOrder)")
                    }) {
                        Text("Repeat Last Order: \(lastOrder)")
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
        }
    }
}

struct OrderMenuView_Previews: PreviewProvider {
    static var previews: some View {
        OrderMenuView()
    }
}

