//
//  RocketMapper.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 08/11/2021.
//

import Foundation

final class RocketMapper {
    
    enum Error: Swift.Error {
        case invalidData
    }
    
    static func map(_ data: Data, from response: HTTPURLResponse) throws -> Rocket {
        guard response.isOK,
            let items = try? JSONDecoder().decode(Rocket.self, from: data) else {
            throw Error.invalidData
        }
        return items
    }
}
