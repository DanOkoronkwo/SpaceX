//
//  Company.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 08/11/2021.
//

import Foundation

public struct Company: Decodable, Equatable {
    
    let name: String
    let founder: String
    let founded: Int
    let employees: Int
    let launchSites: Int
    let valuation: Int
    
    public init(name: String,
         founder: String,
         founded: Int,
         employees: Int,
         launchSites: Int,
         valuation: Int) {
        self.name = name
        self.founder = founder
        self.founded = founded
        self.employees = employees
        self.launchSites = launchSites
        self.valuation = valuation
    }
    
    enum CodingKeys: String, CodingKey {
      case launchSites = "launch_sites"
      case name, founder, founded, employees, valuation
    }
}
