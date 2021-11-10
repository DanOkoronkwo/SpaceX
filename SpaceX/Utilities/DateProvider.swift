//
//  SpaceXDateFormatter.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 09/11/2021.
//

import Foundation

struct DateProvider {
    
    static func currentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy 'at' h:mm"
        return dateFormatter.string(from: Date())
    }
    
    static func formatDate(_ dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy 'at' h:mm"
        
        guard let date = dateFormatter.date(from: dateString) else { return nil }
        return dateFormatter.string(from: date)
    }
    
    static func isFutureDate(_ dateString: String) -> Bool? {
        let todaysDate = Date()
        let dateFormatter = DateFormatter()
        guard let eventDate = dateFormatter.date(from: dateString) else { return nil }
        return eventDate > todaysDate
    }
    
}
