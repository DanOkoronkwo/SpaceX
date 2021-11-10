//
//  URL+Extension.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 08/11/2021.
//

import Foundation

// Swiftly and allows us to keep our implementation code clean from unwraps!
extension URL {
    init(_ string: StaticString) {
        self.init(string: "\(string)")!
    }
}
