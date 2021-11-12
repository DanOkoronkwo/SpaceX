//
//  Patch.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 09/11/2021.
//

import Foundation

public struct Patch: Decodable, Equatable {
    
    let small: String?
    let large: String?
    
    public init(small: String?, large: String?) {
        self.small = small
        self.large = large
    }
    
}
