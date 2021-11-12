//
//  Provider.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 09/11/2021.
//

import Foundation

public class Provider {
    let httpClient: HTTPClient
    let baseUrl: URL
    
    public init(httpClient: HTTPClient,
         baseUrl: URL) {
        self.httpClient = httpClient
        self.baseUrl = baseUrl
    }
}
