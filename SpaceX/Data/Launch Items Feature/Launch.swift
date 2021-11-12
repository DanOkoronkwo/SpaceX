//
//  Launch.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 07/11/2021.
//

import Foundation

public struct Launch: Decodable, Equatable {
    
    let name: String
    let date: String
    let rocket: String?
    let success: Bool?
    let links: Links?
    
    public init(name: String,
         date: String,
         rocket: String?,
         success: Bool?,
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
