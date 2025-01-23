//
//  OrderManager.swift
//  iOSApp1
//
//  Created by Maryam Hina on 2025-01-23.
//

import Foundation

class OrderManager {
    private let lastOrderKey = "LastOrderKey"
    
    // Save the last order
    func saveLastOrder(_ order: String) {
        UserDefaults.standard.set(order, forKey: lastOrderKey)
    }
    
    // Retrieve the last order
    func getLastOrder() -> String? {
        return UserDefaults.standard.string(forKey: lastOrderKey)
    }
}
