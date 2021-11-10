//
//  CompanyUsecase.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 09/11/2021.
//

import Foundation
import Combine

protocol CompanyUseCase {
    func getCompanyViewModel() -> AnyPublisher<CompanyViewModel, Error>
}

struct CompanyUseCaseAdapter: CompanyUseCase {
    
    private let repo: CompanyRepo
    
    init(repo: CompanyRepo) {
        self.repo = repo
    }
    
    func getCompanyViewModel() -> AnyPublisher<CompanyViewModel, Error> {
        return self.repo.getCompany()
            .compactMap({ return CompanyViewModelAdapter(company: $0) })
            .eraseToAnyPublisher()
    }
}
