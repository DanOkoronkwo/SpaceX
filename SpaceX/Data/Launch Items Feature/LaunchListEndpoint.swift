//
//  LaunchesEndpoint.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 08/11/2021.
//

import Foundation

struct LaunchListEndpoint {
    
    static func url(baseUrl: URL) -> URL  {
        return baseUrl.appendingPathComponent("launches").appendingPathComponent("query")
    }
    
}


