//
//  NumberProvider.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 09/11/2021.
//

import Foundation

/// Struct for number conversion requirements
struct NumberProvider {
    /// Convert integer value to formatted decimal string.
    static func formatToDecimal(_ value: Int) -> String? {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .decimal
        
        guard let formattedValue = currencyFormatter.string(from: NSNumber(value: value)) else { return nil }
        return formattedValue
    }
}
