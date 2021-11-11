//
//  Patch.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 07/11/2021.
//

import Foundation

struct Patch: Decodable {
    
    let small: String?
    let large: String?
    
    init(small: String?,
         large: String) {
        self.small = small
        self.large = large
    }
    
}
