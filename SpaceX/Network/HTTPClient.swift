//
//  HTTPClient.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 07/11/2021.
//

import Foundation
import Combine

public protocol HTTPClientTask {
    func cancel()
}

public protocol HTTPClient {
    typealias Result = Swift.Result<(Data, HTTPURLResponse), Error>
    
    /// The completion handler can be invoked in any thread
    /// Clients are responsible to dispatch to appropriate threads, if needed.
    @discardableResult
    func get(from url: URL, completion: @escaping (Result) -> Void) -> HTTPClientTask
    
    @discardableResult
    func post(using urlRequest: URLRequest, completion: @escaping (Result) -> Void) -> HTTPClientTask
}

public extension HTTPClient {
    typealias Publisher = AnyPublisher<(Data, HTTPURLResponse), Error>
    
    func getPublisher(url: URL) -> Publisher {
        var task: HTTPClientTask?
        
        return Deferred {
            Future { completion in
                task = self.get(from: url, completion: completion)
            }
        }
        .handleEvents(receiveCancel: { task?.cancel() })
        .eraseToAnyPublisher()
    }
    
    func getPublisher(urlRequest: URLRequest) -> Publisher {
        var task: HTTPClientTask?
        
        return Deferred {
            Future { completion in
                task = self.post(using: urlRequest, completion: completion)
            }
        }
        .handleEvents(receiveCancel: { task?.cancel() })
        .eraseToAnyPublisher()
    }
}
