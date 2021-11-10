//
//  LaunchListRepo.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 08/11/2021.
//

import Foundation
import Combine

protocol LaunchListRepo {
    func getLaunchList(for query: LaunchListQueryAdapter) -> AnyPublisher<LaunchListResponse, Error>
}

class LaunchListProvider: Provider, LaunchListRepo {
    
    func getLaunchList(for query: LaunchListQueryAdapter) -> AnyPublisher<LaunchListResponse, Error> {
        
        let url = LaunchListEndpoint.url(baseUrl: baseUrl)
        let request = LaunchListRequest(endPoint: url, htmlBody: query.toJSON())
        
        return httpClient
            .getPublisher(urlRequest: request.generateRequest())
            .tryMap(LaunchListMapper.map)
            .eraseToAnyPublisher()
    }
    
}

