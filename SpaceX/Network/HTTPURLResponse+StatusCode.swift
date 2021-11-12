//
//  HTTPURLResponse+StatusCode.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 07/11/2021.
//

import Foundation

extension HTTPURLResponse {
    var isOK: Bool {
        statusCode == 200
    }
}
