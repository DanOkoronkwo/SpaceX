//
//  LaunchListRequest.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 08/11/2021.
//

import Foundation

struct LaunchListRequest {
    
    private let endpoint: URL
    private let htmlBody: Data?
    
    init(endPoint: URL, htmlBody: Data?) {
        self.endpoint = endPoint
        self.htmlBody = htmlBody
    }
    
    func generateRequest() -> URLRequest {
        var urlRequest = URLRequest(url: endpoint)
        urlRequest.httpBody = htmlBody
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = "POST"
        return urlRequest
    }
    
}
