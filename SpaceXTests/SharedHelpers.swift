//
//  SharedHelpers.swift
//  SpaceXTests
//
//  Created by Daniel Okoronkwo on 12/11/2021.
//

import Foundation

func anyURL() -> URL {
    return URL(string: "http://any-url.com")!
}

func makeItemsJSON(_ items: [String: Any]) -> Data {
    let json = items
    return try! JSONSerialization.data(withJSONObject: json)
}

extension HTTPURLResponse {
    convenience init(statusCode: Int) {
        self.init(url: anyURL(), statusCode: statusCode, httpVersion: nil, headerFields: nil)!
    }
}
