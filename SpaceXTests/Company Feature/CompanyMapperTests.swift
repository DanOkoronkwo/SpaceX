//
//  CompanyMapperTests.swift
//  SpaceXTests
//
//  Created by Daniel Okoronkwo on 12/11/2021.
//

import XCTest
import SpaceX

class CompanyMapperTests: XCTestCase {

    func test_map_throwsErrorOnNon2xxHTTPResponse() throws {
        let json = makeItemsJSON([:])
        let sample = 400
        
        XCTAssertThrowsError(
            try CompanyMapper.map(json, from: HTTPURLResponse(statusCode: sample))
        )
    }
    
    func test_map_throwsErrorOn2xxHTTPResponseWithInvalidJSON() throws {
        let invalidJSON = Data("invalid json".utf8)
        let sample = 200
        
        XCTAssertThrowsError(
            try CompanyMapper.map(invalidJSON, from: HTTPURLResponse(statusCode: sample))
        )
    }
    
    func test_map_deliversItemsOn2xxHTTPResponseWithJSONItems() throws {
        let itemOne = makeItem(
            name: "SpaceX",
            founder: "Elon",
            founded: 2000,
            employees: 2000,
            launchSites: 123,
            valuation: 1233456787
        )
       
        let json = makeItemsJSON(itemOne.json)
        let sample = 200
    
        let result = try CompanyMapper.map(json, from: HTTPURLResponse(statusCode: sample))
        XCTAssertEqual(result, itemOne.model)
        
    }
  
    // MARK: - Helpers
    
    private func makeItem(name: String,
                          founder: String,
                          founded: Int,
                          employees: Int,
                          launchSites: Int,
                          valuation: Int) -> (model: Company, json: [String: Any]) {
        
        let item = Company(name: name,
                           founder: founder,
                           founded: founded,
                           employees: employees,
                           launchSites: launchSites,
                           valuation: valuation)
        
        let json: [String: Any] = [
            "name": name,
            "founder": founder,
            "founded": founded,
            "employees": employees,
            "launch_sites": launchSites,
            "valuation": valuation
        ]
        
        return (item, json)
    }

}
