//
//  Constants.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 07/11/2021.
//

import Foundation

struct Constants {
    static let baseURL = URL("https://api.spacexdata.com/v4/")
    static let homeTitle = NSLocalizedString("SPACE X", comment: "Home View Title")
    
    enum TableViewIdentifiers: String {
        case CompanyDescriptionCell = "CompanyViewCellIdentifier"
    }
}
