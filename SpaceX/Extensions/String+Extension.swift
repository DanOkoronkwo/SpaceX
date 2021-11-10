//
//  String+Extension.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 09/11/2021.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment:"")
    }
}
