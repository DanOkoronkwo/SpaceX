//
//  LaunchListResponse.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 12/11/2021.
//

import Foundation

public struct LaunchesQueryResponse: Decodable, Equatable {
    let docs: [Launch]
    let hasNextPage: Bool
    
    public init(docs: [Launch], hasNextPage: Bool) {
        self.docs = docs
        self.hasNextPage = hasNextPage
    }
}
