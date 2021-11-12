//
//  CompanyEndpointTests.swift
//  SpaceXTests
//
//  Created by Daniel Okoronkwo on 12/11/2021.
//

import XCTest
import SpaceX

class CompanyEndpointTests: XCTestCase {

    func test_endPoint_url() {
        let baseURL = URL(string: "https://api.spacexdata.com/v4/")!
        
        let received = CompanyEndpoint.url(baseUrl: baseURL)
        let expected = URL(string: "https://api.spacexdata.com/v4/company")!
        
        XCTAssertEqual(received, expected)
    }

}
