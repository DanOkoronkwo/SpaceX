//
//  LaunchListRequest.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 09/11/2021.
//

import Foundation

struct LaunchListRequest {
    
    static func request(with query: LaunchListQueryAdapter, endPoint: URL) -> URLRequest {
        var urlRequest = URLRequest(url: endPoint)
        urlRequest.httpBody = query.toJSON()
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = "POST"
        return urlRequest
    }
    
}
