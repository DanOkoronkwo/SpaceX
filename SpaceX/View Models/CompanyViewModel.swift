//
//  CompanyViewModel.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 09/11/2021.
//

import Foundation

protocol CompanyViewModel {
    var companyDescription: String { get }
}

struct CompanyViewModelAdapter {
    let company: Company
    
    init(company: Company) {
        self.company = company
    }
}

extension CompanyViewModelAdapter: CompanyViewModel {
    
    var companyDescription: String {
        
        let valuation = NumberProvider.formatToDecimal(company.valuation) ?? "0"
        
        return "\(company.name) \("was founded by".localized) \(company.founder) \("in".localized) \(company.founded). \("It has now".localized) \(company.employees) \("employees".localized), \(company.launchSites) \("launch sites, and is valued at USD ".localized)\(valuation)."
    }
    
}
