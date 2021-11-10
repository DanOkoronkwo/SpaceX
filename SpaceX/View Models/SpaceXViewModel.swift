//
//  SpaceXViewModel.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 09/11/2021.
//

import Foundation
import Combine

protocol SpaceXViewModel {
    func getCompanyViewModel() -> CompanyViewModel?
    func fetchData(_ presenterView: SpaceXView)
}

class SpaceXViewModelAdapter: SpaceXViewModel {
    
    private var companyModel: CompanyViewModel?
    
    private let companyRepo: CompanyRepo
    private let rocketRepo: RocketRepo
    private let launchListRepo: LaunchListRepo
    
    private var page = 0
    
    private var cancellable: Cancellable?
    
    init(companyRepo: CompanyRepo,
         rocketRepo: RocketRepo,
         launchListRepo: LaunchListRepo) {
        self.companyRepo = companyRepo
        self.rocketRepo = rocketRepo
        self.launchListRepo = launchListRepo
    }
    
    func getCompanyViewModel() -> CompanyViewModel? {
        return companyModel
    }
    
    func fetchData(_ presenterView: SpaceXView) {
        
        presenterView.showLoading()
        
        cancellable = launchListRepo.getLaunchList(for: queryAdapter)
            .map { (reponse)  -> [LaunchItemViewModel] in
            
                let launchItemViewModels = reponse.docs.compactMap {
                return LaunchItem(
                    lauch: $0,
                    rocket: Rocket(id: "Rocket", name: "Name", type: "Type")
                )
            }
            
            return (launchItemViewModels)
        }
        .receive(on: DispatchQueue.main)
        .sink(receiveCompletion: { completion in
            switch completion {
            case .finished: break
            case let .failure(error):
                presenterView.didLoadWithError(error)
                break
            }
        }, receiveValue: { loadedItems in
            
        })
    }
    
    private var queryAdapter: LaunchListQueryAdapter {
        let adapter = LaunchListQueryAdapter(
            query: nil,
            options: LaunchListQueryAdapter.Options(
                limit: 10,
                page: page,
                sort: nil)
        )
        return adapter
    }
}
