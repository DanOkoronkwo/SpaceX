//
//  NumberProvider.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 09/11/2021.
//

import Foundation

struct NumberProvider {
    
    static func formatToCurrency(_ value: Int) -> String? {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        
        guard let formattedValue = currencyFormatter.string(from: NSNumber(value: value)) else { return nil }
        return formattedValue
    }
}
