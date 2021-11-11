//
//  LaunchListRequest.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 08/11/2021.
//

import Foundation

struct LaunchListRequest {
    
    static func generateRequest(endPoint: URL, htmlBody: Data?) -> URLRequest {
        var urlRequest = URLRequest(url: endPoint)
        urlRequest.httpBody = htmlBody
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = "POST"
        return urlRequest
    }
    
}
