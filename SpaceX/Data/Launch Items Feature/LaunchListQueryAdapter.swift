//
//  LaunchListQueryAdapter.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 09/11/2021.
//

import Foundation

struct LaunchListQueryAdapter: Encodable {
    
    struct Query: Encodable {
        let success: Bool
    }
    
    struct Options: Encodable {
        
        enum PropertyRestriction: String, CaseIterable, Encodable {
           case rocket, name, success, date_utc
        }
        
        let pagination: Bool
        
        /// In order to minimize bandwidth and improve performance, restrict response to only whats necesary
        let select: [PropertyRestriction]
        
        let limit: Int
        let page: Int
        let sort: SortAdapter?
        
        init(pagination: Bool = true,
             select: [PropertyRestriction] = PropertyRestriction.allCases,
             limit: Int,
             page: Int,
             sort: SortAdapter?) {
            self.pagination = pagination
            self.select = select
            self.limit = limit
            self.page = page
            self.sort = sort
        }
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
