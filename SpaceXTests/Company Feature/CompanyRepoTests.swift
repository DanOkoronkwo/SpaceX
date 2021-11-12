//
//  CompanyRepoTests.swift
//  SpaceXTests
//
//  Created by Daniel Okoronkwo on 12/11/2021.
//

import XCTest
import SpaceX
import Foundation
import Combine

class CompanyRepoTests: XCTestCase {
    
    private var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        cancellables = []
    }
    
    func testrequestcompanyInfo() throws {
        
        let baseURL = URL(string: "https://api.spacexdata.com/v4/")!
        let client = URLSessionHTTPClient(session: URLSession(configuration: .ephemeral))
        
        let companyRepo = CompanyRepoProvider(httpClient: client, baseUrl: baseURL)
        
        let companyLocal = Company(
            name: "SpaceX",
            founder: "Elon Musk",
            founded: 2002,
            employees: 9500,
            launchSites: 3,
            valuation: 74000000000
        )
        
        // Declaring local variables that we'll be able to write
        // our output to, as well as an expectation that we'll
        // use to await our asynchronous result:
        var company: Company?
        var error: Error?
        let expectation = self.expectation(description: "CompanyInfo")
        
        // Setting up our Combine pipeline:
        companyRepo.getCompany()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let encounteredError):
                    error = encounteredError
                }
                
                // Fullfilling our expectation to unblock
                // our test execution:
                expectation.fulfill()
            }, receiveValue: { value in
                company = value
            })
            .store(in: &cancellables)
        
        // Awaiting fulfilment of expecation before performing our asserts:
        waitForExpectations(timeout: 10)
        
        // Asserting that our Combine pipeline yielded the correct output:
        XCTAssertNil(error)
        XCTAssertEqual(company, companyLocal)
        
        
        
    }
    
    
    
}
