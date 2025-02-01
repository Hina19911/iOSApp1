//
//  OrderSummaryViews.swift
//  iOSApp1
//
//  Created by Maryam Hina on 2025-02-01.
//

import SwiftUI

struct OrderSummaryView: View {
    let coffeeCount: Int
    let donutCount: Int
    let bagelCount: Int
    let muffinCount: Int
    let sandwichCount: Int
    let totalCost: Double
    
    @State private var timeElapsed = 0  // State to track elapsed time
    @State private var timerIsActive = true  // To start/stop the timer

    // Timer logic
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack(spacing: 20) {
            Text("Your Order")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            if coffeeCount > 0 { Text("\(coffeeCount) x Coffee") }
            if donutCount > 0 { Text("\(donutCount) x Donut") }
            if bagelCount > 0 { Text("\(bagelCount) x Bagel") }
            if muffinCount > 0 { Text("\(muffinCount) x Muffin") }
            if sandwichCount > 0 { Text("\(sandwichCount) x Sandwich") }
            
            Text("Total Cost: $\(totalCost, specifier: "%.2f")")
                .font(.headline)
                .foregroundColor(.green)
            
            // Display Timer
            Text("Time Elapsed: \(timeElapsed) seconds")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Button(action: {
                // Checkout action
                print("Proceeding to checkout...")
                timerIsActive = false  // Stop timer when checkout happens
            }) {
                Text("Checkout")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal)
        }
        .padding()
        .navigationTitle("Order Summary")
        .onReceive(timer) { _ in
            if timerIsActive {
                timeElapsed += 1  // Increase timeElapsed every second
            }
        }
    }
}

struct OrderSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        OrderSummaryView(coffeeCount: 2, donutCount: 1, bagelCount: 1, muffinCount: 0, sandwichCount: 0, totalCost: 12.50)
    }
}
