//
//  CompanyEndpoint.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 08/11/2021.
//

import Foundation

public struct CompanyEndpoint {
    
    public static func url(baseUrl: URL) -> URL {
        return baseUrl.appendingPathComponent("company")
    }
    
}
