//
//  HTTPURLResponse+StatusCode.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 09/11/2021.
//

import Foundation

extension HTTPURLResponse {
    var isOK: Bool {
        statusCode == 200
    }
}
