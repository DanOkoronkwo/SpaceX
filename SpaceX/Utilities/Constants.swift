//
//  Constants.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 07/11/2021.
//

import Foundation

struct Constants {
    
    // MARK: - URLS
    static let baseURL = URL("https://api.spacexdata.com/v4/")
    
    // MARK: - STRINGS
    static let homeTitle = NSLocalizedString("SPACE X", comment: "Home View Title")
    static let dateTimeTitle = NSLocalizedString("Date/Time", comment: "Date/Time Title")
    static let rocketTitle = NSLocalizedString("Rocket", comment: "Rocket Title")
    static let missionTitle = NSLocalizedString("Mission", comment: "Rocket Title")
    
    // MARK: - TABLE VIEW CELL IDENTIFIERS
    static let CompanyDescriptionCell = "CompanyViewCellIdentifier"
    static let LaunchItemCell = "LaunchItemViewCellIdentifier"
    
}
