//
//  LaunchesQueryResponseMapper.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 12/11/2021.
//

import Foundation

/// Launch list decoding mapper component where query html body object required.
public struct LaunchesQueryResponseMapper {
    
    public enum Error: Swift.Error {
        case invalidData
        case networkError
    }
    
    public static func map(_ data: Data, from response: HTTPURLResponse) throws -> LaunchesQueryResponse {
        guard response.isOK else {
            throw Error.networkError
        }
        
        guard let launchListResponse = try? JSONDecoder().decode(LaunchesQueryResponse.self, from: data) else {
            throw Error.invalidData
        }
        
        return launchListResponse
    }

}
