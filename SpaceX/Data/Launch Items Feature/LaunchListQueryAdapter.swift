//
//  LaunchListQueryAdapter.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 08/11/2021.
//

import Foundation

struct LaunchListQueryAdapter: Encodable {
    
    struct Query: Encodable {
        let success: Bool
    }
    
    struct Options: Encodable {
        
        let pagination = true
        let select: [String] = ["rocket", "name", "success", "date_utc"]
        
        let limit: Int
        let page: Int
        let sort: SortAdapter?
    }
    
    struct SortAdapter: Encodable {
        let flightNumber: Bool
        
        enum CodingKeys: String, CodingKey {
            case flightNumber = "flight_number"
        }
    }
    
    let query: Query?
    let options: Options
    
    func toJSON() -> Data? {
        return try? JSONEncoder().encode(self)
    }
    
}
