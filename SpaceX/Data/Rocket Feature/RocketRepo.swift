//
//  RocketRepo.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 09/11/2021.
//

import Foundation
import Combine

protocol RocketRepo: AnyObject {
    func getRocket(id: String) -> AnyPublisher<Rocket, Error>
}

class RocketProvider: Provider, RocketRepo {
  
    func getRocket(id: String) -> AnyPublisher<Rocket, Error> {
        let url = RocketEndpoint.url(baseUrl: baseUrl, id: id)
        
        return httpClient
            .getPublisher(url: url)
            .tryMap(RocketMapper.map)
            .eraseToAnyPublisher()
    }
    
}
