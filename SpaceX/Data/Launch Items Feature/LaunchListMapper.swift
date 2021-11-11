//
//  LaunchListMapper.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 08/11/2021.
//

import Foundation

struct LaunchListMapper {
    
    enum Error: Swift.Error {
        case invalidData
    }
    
    static func map(_ data: Data, from response: HTTPURLResponse) throws -> LaunchListResponse {
        guard response.isOK,
              let launchListResponse = try? JSONDecoder().decode(LaunchListResponse.self, from: data) else {
            throw Error.invalidData
        }
        return launchListResponse
    }
}
