//
//  CompanyRepo.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 09/11/2021.
//

import Foundation
import Combine

public protocol CompanyRepo: AnyObject {
    func getCompany() -> AnyPublisher<Company, Error>
}

public class CompanyRepoProvider: Provider, CompanyRepo {
    
    public func getCompany() -> AnyPublisher<Company, Error> {
        let url = CompanyEndpoint.url(baseUrl: Constants.baseURL)
        
        return httpClient
            .getPublisher(url: url)
            .tryMap(CompanyMapper.map)
            .eraseToAnyPublisher()
    }
    
}
