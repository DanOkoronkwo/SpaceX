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
        case networkError
    }
    
    static func map(_ data: Data, from response: HTTPURLResponse) throws -> LaunchListResponse {
        guard response.isOK else {
            throw Error.networkError
        }
        
        guard let launchListResponse = try? JSONDecoder().decode(LaunchListResponse.self, from: data) else {
            throw Error.invalidData
        }
        
        return launchListResponse
    }
    
    static func mapAll(_ data: Data, from response: HTTPURLResponse) throws -> [Launch] {
        guard response.isOK else {
            throw Error.networkError
        }
        
        guard let launchList = try? JSONDecoder().decode([Launch].self, from: data) else {
            throw Error.invalidData
        }
        
        return launchList
    }

}
