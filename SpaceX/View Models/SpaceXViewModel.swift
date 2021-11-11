//
//  SpaceXViewModel.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 09/11/2021.
//

import Foundation
import Combine

protocol SpaceXViewModel {
    var totalLaunchItems: Int { get }
    func getModel(at indexPath: IndexPath) -> LaunchItemViewModel?
    func getCompanyViewModel() -> CompanyViewModel?
    func fetchData(_ presenterView: SpaceXView)
    var headerTitle: String { get }
}

class SpaceXViewModelAdapter: SpaceXViewModel {
    
    private var companyModel: CompanyViewModel?
    private var launchItems: [LaunchItemViewModel]?
    
    var totalLaunchItems: Int {
        return launchItems?.count ?? 0
    }
    
    private let companyRepo: CompanyRepo
    private let rocketRepo: RocketRepo
    private let launchListRepo: LaunchListRepo
    
    private var page = 0
    
    private var companyCancellable: Cancellable?
    private var launchesCancellable: Cancellable?
    
    var headerTitle: String {
        return Constants.homeTitle
    }
    
    init(companyRepo: CompanyRepo,
         rocketRepo: RocketRepo,
         launchListRepo: LaunchListRepo) {
        self.companyRepo = companyRepo
        self.rocketRepo = rocketRepo
        self.launchListRepo = launchListRepo
    }
    
    func getModel(at indexPath: IndexPath) -> LaunchItemViewModel? {
        return launchItems?[indexPath.row]
    }
    
    func getCompanyViewModel() -> CompanyViewModel? {
        return companyModel
    }
    
    func fetchData(_ presenterView: SpaceXView) {
        fetchCompanyInfo(presenterView)
        fetchLaunchItems(presenterView)
    }
    
    private func fetchLaunchItems(_ presenterView: SpaceXView) {
        presenterView.showLoading()
        
        launchesCancellable = launchListRepo.getLaunchList(for: queryAdapter)
            .map { (launchResponse)  -> [LaunchItemViewModel] in
                let items: [LaunchItemViewModel] = launchResponse.docs.compactMap {
                    return LaunchItem(
                        lauch: $0,
                        rocket: Rocket(id: "Rocket", name: "Name", type: "Type")
                    )
                }
                
                return items
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished: break
                case let .failure(error):
                    presenterView.didLoadWithError(error)
                    break
                }
            }, receiveValue: { [weak self] models in
                self?.launchItems?.append(contentsOf: models)
                presenterView.reloadTableView()
            })
    }

    private func fetchCompanyInfo(_ presenterView: SpaceXView) {
        companyCancellable = companyRepo.getCompany()
            .map { (companyModel) -> CompanyViewModel in
                return CompanyViewModelAdapter(company: companyModel)
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished: break
                case let .failure(error):
                    presenterView.didLoadWithError(error)
                    break
                }
            }, receiveValue: { [weak self] viewModel in
                self?.companyModel = viewModel
                presenterView.reloadTableView()
            })
    }

    private var queryAdapter: LaunchListQueryAdapter {
        let adapter = LaunchListQueryAdapter(
            query: LaunchListQueryAdapter.Query(success: true),
            options: LaunchListQueryAdapter.Options(
                limit: 10,
                page: page,
                sort: nil
            )
        )
        return adapter
    }
}
