//
//  CompanyEndpoint.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 08/11/2021.
//

import Foundation

struct CompanyEndpoint {
    
    static func url(baseUrl: URL) -> URL {
        return baseUrl.appendingPathComponent("company")
    }
    
}
