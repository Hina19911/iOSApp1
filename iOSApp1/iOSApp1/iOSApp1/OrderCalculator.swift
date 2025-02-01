//
//  OrderCalculator.swift
//  iOSApp1
//
//  Created by Maryam Hina on 2025-02-01.
//

import Foundation

class OrderCalculator {
    // Item prices
    static let prices: [String: Double] = [
        "Coffee": 2.50,
        "Donut": 1.50,
        "Bagel": 2.00,
        "Muffin": 2.75,
        "Sandwich": 4.00
    ]

    // Generate order summary
    static func generateOrderSummary(coffee: Int, donut: Int, bagel: Int, muffin: Int, sandwich: Int) -> String {
        var orderParts: [String] = []
        if coffee > 0 { orderParts.append("\(coffee) x Coffee") }
        if donut > 0 { orderParts.append("\(donut) x Donut") }
        if bagel > 0 { orderParts.append("\(bagel) x Bagel") }
        if muffin > 0 { orderParts.append("\(muffin) x Muffin") }
        if sandwich > 0 { orderParts.append("\(sandwich) x Sandwich") }
        return orderParts.joined(separator: ", ")
    }

    // Calculate total items
    static func totalItems(coffee: Int, donut: Int, bagel: Int, muffin: Int, sandwich: Int) -> Int {
        return coffee + donut + bagel + muffin + sandwich
    }

    // Calculate total price
    static func calculateTotalPrice(coffee: Int, donut: Int, bagel: Int, muffin: Int, sandwich: Int) -> Double {
        return (Double(coffee) * prices["Coffee", default: 0]) +
               (Double(donut) * prices["Donut", default: 0]) +
               (Double(bagel) * prices["Bagel", default: 0]) +
               (Double(muffin) * prices["Muffin", default: 0]) +
               (Double(sandwich) * prices["Sandwich", default: 0])
    }
}
