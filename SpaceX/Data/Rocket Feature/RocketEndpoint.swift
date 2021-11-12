//
//  RocketEndpoint.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 09/11/2021.
//

import Foundation

struct RocketEndpoint {
    
    static func url(baseUrl: URL, id: String) -> URL {
        return baseUrl.appendingPathComponent("rockets").appendingPathComponent("\(id)")
    }
    
}
