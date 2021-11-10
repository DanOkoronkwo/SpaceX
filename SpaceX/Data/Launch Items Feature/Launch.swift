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
    let rocket: String
    let success: Bool
    let links: Links?
    
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
