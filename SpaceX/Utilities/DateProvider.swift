//
//  SpaceXDateFormatter.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 09/11/2021.
//

import Foundation

struct DateProvider {
    
    static let date = Date()
    
    static func formatDate(_ date: Date?) -> String? {
        
        guard let date = date else { return nil }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy 'at' h:mm"
        return dateFormatter.string(from: date)
    }
    
    static func formatRemoteDate(_ dateString: String) -> Date? {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        guard let date = formatter.date(from: dateString) else {
            return nil
        }
        return date
    }
    
    static func isFutureDate(_ dateString: String) -> Bool? {
        let todaysDate = Date()
        let dateFormatter = DateFormatter()
        guard let eventDate = dateFormatter.date(from: dateString) else { return nil }
        return eventDate > todaysDate
    }
    
    static func dateToYear(_ date: Date?) -> String? {
        guard let date = date else { return nil }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: date)
    }
    
}
