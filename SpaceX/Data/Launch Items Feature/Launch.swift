//
//  Launch.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 07/11/2021.
//

import Foundation

struct Launch: Decodable {
    
    let name: String
    let date: String
    let rocket: UUID
    let success: Bool
    let links: Links?
    
    init(name: String,
         date: String,
         rocket: UUID,
         success: Bool,
         links: Links?) {
        self.name = name
        self.date = date
        self.rocket = rocket
        self.success = success
        self.links = links
    }
    
    enum CodingKeys: String, CodingKey {
        case date = "date_utc"
        case name
        case rocket
        case success
        case links
    }
    
}

struct LaunchListResponse: Decodable {
    let docs: [Launch]
}
