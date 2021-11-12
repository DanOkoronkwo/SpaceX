//
//  Constants.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 09/11/2021.
//

import Foundation

struct Constants {
    
    // MARK: - URLS
    static let baseURL = URL("https://api.spacexdata.com/v4/")
    
    // MARK: - STRINGS
    static let homeTitle = NSLocalizedString("SPACE X", comment: "Home View Title")
    static let dateTimeTitle = NSLocalizedString("Date/Time", comment: "Date/Time Title")
    static let rocketTitle = NSLocalizedString("Rocket", comment: "Rocket Title")
    static let missionTitle = NSLocalizedString("Mission", comment: "Mission Title")
    static let filterByYear = NSLocalizedString("FILTER BY YEAR", comment: "Fitler Title")
    static let sort = NSLocalizedString("SORT", comment: "Sort Title")
    static let cancel = NSLocalizedString("CANCEL", comment: "Cancel Title")
    static let launches = NSLocalizedString("LAUNCHES", comment: "Launch Title")
    static let company = NSLocalizedString("COMPANY", comment: "Company Title")
    static let filterSortTitle = NSLocalizedString("Filter & Sort", comment: "Filter & Sort Title")
    
    // MARK: - TABLE VIEW CELL IDENTIFIERS
    static let CompanyDescriptionCell = "CompanyViewCellIdentifier"
    static let LaunchItemCell = "LaunchItemViewCellIdentifier"
    
}
