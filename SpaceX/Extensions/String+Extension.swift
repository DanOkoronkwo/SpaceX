//
//  String+Extension.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 09/11/2021.
//

import Foundation

extension String {
    /// Shorthand for localisedstring without commentary
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
