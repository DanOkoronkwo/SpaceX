//
//  CompanyRepo.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 08/11/2021.
//

import Foundation
import Combine

protocol CompanyRepo: AnyObject {
    func getCompany() -> AnyPublisher<Company, Error>
}

class CompanyRepoProvider: Provider, CompanyRepo {
    
    func getCompany() -> AnyPublisher<Company, Error> {
        let url = CompanyEndpoint.url(baseUrl: Constants.baseURL)
        
        return httpClient
            .getPublisher(url: url)
            .tryMap(CompanyMapper.map)
            .eraseToAnyPublisher()
    }
    
}
