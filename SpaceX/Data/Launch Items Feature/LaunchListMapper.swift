//
//  LaunchListMapper.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 09/11/2021.
//

import Foundation

/// Launch list decoding mapper component where query html body object not required.
public struct LaunchListMapper {
    
    public enum Error: Swift.Error {
        case invalidData
        case networkError
    }
    
    public static func map(_ data: Data, from response: HTTPURLResponse) throws -> [Launch] {
        guard response.isOK else {
            throw Error.networkError
        }
        
        guard let launchList = try? JSONDecoder().decode([Launch].self, from: data) else {
            throw Error.invalidData
        }
        
        return launchList
    }

}
