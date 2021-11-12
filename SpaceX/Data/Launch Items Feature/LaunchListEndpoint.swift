//
//  LaunchesEndpoint.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 08/11/2021.
//

import Foundation

struct LaunchListEndpoint {
    
    static func url(baseUrl: URL, addQuery: Bool) -> URL  {
        let url =  baseUrl.appendingPathComponent("launches")
        return addQuery ? url.appendingPathComponent("query") : url
    }
    
}


