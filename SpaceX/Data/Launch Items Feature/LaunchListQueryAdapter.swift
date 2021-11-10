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
        
        enum selectOptions: String, Encodable {
            case rocket
            case name
            case links
            case success
            case data_utc
        }
        
        let pagination = true
        let select: [selectOptions] = [.rocket, .name, .links, .success, .data_utc]
        
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
