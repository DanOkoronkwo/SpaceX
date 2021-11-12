//
//  LaunchListMapperTests.swift
//  SpaceXTests
//
//  Created by Daniel Okoronkwo on 12/11/2021.
//

import XCTest
import SpaceX

class LaunchesListQueryMapperTests: XCTestCase {

    func test_map_throwsErrorOnNon2xxHTTPResponse() throws {
        let json = makeItemsJSON([:])
        let sample = 400
        
        XCTAssertThrowsError(
            try LaunchesQueryResponseMapper.map(json, from: HTTPURLResponse(statusCode: sample))
        )
    }
    
    func test_map_throwsErrorOn2xxHTTPResponseWithInvalidJSON() throws {
        let invalidJSON = Data("invalid json".utf8)
        let sample = 200
        
        XCTAssertThrowsError(
            try LaunchesQueryResponseMapper.map(invalidJSON, from: HTTPURLResponse(statusCode: sample))
        )
        
    }
    
    func test_map_deliversItemOnHTTPResponseWithJSONItems() throws {
        let itemOne = makeItem(docs: [], hasNextPage: true)
   
        let json = makeItemsJSON(itemOne.json)
        let sample = 200
    
        let result = try LaunchesQueryResponseMapper.map(json, from: HTTPURLResponse(statusCode: sample))
        XCTAssertEqual(result, itemOne.model)
        
    }
    
    // MARK: - Helpers
    
    private func makeItem(docs: [Launch], hasNextPage: Bool) -> (model: LaunchesQueryResponse, json: [String: Any]) {
        let item = LaunchesQueryResponse(docs: docs, hasNextPage: hasNextPage)
        
        let json: [String: Any] = [
            "docs": docs,
            "hasNextPage": hasNextPage
        ]
        
        return (item, json)
    }
    

}
