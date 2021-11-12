//
//  CompanyMapper.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 08/11/2021.
//

import Foundation

final class CompanyMapper {
    
    public enum Error: Swift.Error {
        case invalidData
        case networkError
    }
    
    public static func map(_ data: Data, from response: HTTPURLResponse) throws -> Company {
        guard response.isOK else {
            throw Error.networkError
        }
        
        guard let companyData = try? JSONDecoder().decode(Company.self, from: data) else {
            throw Error.invalidData
        }
        return companyData
    }
    
}
