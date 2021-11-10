//
//  URLSessionHTTPClient.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 07/11/2021.
//

import Foundation

final class URLSessionHTTPClient: HTTPClient {
    private let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    private struct UnexpectedValueRepresentation: Error {}
    
    private struct URLSessionTaskWrapper: HTTPClientTask {
        let wrapped: URLSessionTask
        
        func cancel() {
            wrapped.cancel()
        }
    }
    
    func get(from url: URL, completion: @escaping (HTTPClient.Result) -> Void) -> HTTPClientTask {
        let task = session.dataTask(with: url) { data, response, error in
            completion(Result{
                if let error = error {
                    throw error
                } else if let data = data, let response = response as? HTTPURLResponse {
                    return (data, response)
                } else {
                    throw UnexpectedValueRepresentation()
                }
            })
        }
        task.resume()
        return URLSessionTaskWrapper(wrapped: task)
    }
    
    func post(using urlRequest: URLRequest, completion: @escaping (HTTPClient.Result) -> Void) -> HTTPClientTask {
        let task = session.dataTask(with: urlRequest) { data, response, error in
            completion(Result{
                if let error = error {
                    throw error
                } else if let data = data, let response = response as? HTTPURLResponse {
                    return (data, response)
                } else {
                    throw UnexpectedValueRepresentation()
                }
            })
        }
        
        task.resume()
        return URLSessionTaskWrapper(wrapped: task)
    }
}
