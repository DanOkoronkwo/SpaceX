//
//  LaunchListRepo.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 09/11/2021.
//

import Foundation
import Combine

protocol LaunchListRepo {
    func getLaunchList(for query: LaunchListQueryAdapter) -> AnyPublisher<LaunchesQueryResponse, Error>
    func getAllLaunches() -> AnyPublisher<[Launch], Error>
}

class LaunchListProvider: Provider, LaunchListRepo {

    /// Get `Launch` objects where query config required
    func getLaunchList(for query: LaunchListQueryAdapter) -> AnyPublisher<LaunchesQueryResponse, Error> {
        
        let url = LaunchListEndpoint.url(baseUrl: baseUrl, addQuery: true)
        let request = LaunchListRequest.request(with: query, endPoint: url)
        
        return httpClient
            .getPublisher(urlRequest: request)
            .tryMap(LaunchesQueryResponseMapper.map)
            .eraseToAnyPublisher()
    }
    
    /// Get all `Launch` objects without pagination. Used in filter as api  response not robust enough to filter and gather year values
    func getAllLaunches() -> AnyPublisher<[Launch], Error> {
        
        let url = LaunchListEndpoint.url(baseUrl: baseUrl, addQuery: false)
        
        return httpClient
            .getPublisher(url: url)
            .tryMap(LaunchListMapper.map)
            .eraseToAnyPublisher()
    }
    
}

