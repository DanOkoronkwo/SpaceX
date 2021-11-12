//
//  CompanyMapper.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 09/11/2021.
//

import Foundation

public final class CompanyMapper {
    
    public enum Error: Swift.Error {
        case invalidData
        case networkError
    }
    
    public static func map(_ data: Data, from response: HTTPURLResponse) throws -> Company {
        guard response.isOK else {
            throw Error.networkError
        }
        
        let companyData: Company
        
        do {
            companyData = try JSONDecoder().decode(Company.self, from: data)
        } catch _ {
            throw Error.invalidData
        }
        return companyData
    }
    
}
