//
//  LaunchListResponse.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 12/11/2021.
//

import Foundation

/// Struct that represents data received where
/// query object is set for html body for Launch request
/// `public` for access in Test
/// `Decodabe` conformance for easy json decoding from response
///  `Equatable` Equate to different object for e.g. in XCTest Asserts
public struct LaunchesQueryResponse: Decodable, Equatable {
    
    let docs: [Launch]
    let hasNextPage: Bool
    
    public init(docs: [Launch], hasNextPage: Bool) {
        self.docs = docs
        self.hasNextPage = hasNextPage
    }
}
