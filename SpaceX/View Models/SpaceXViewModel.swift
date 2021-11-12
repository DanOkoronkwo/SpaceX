//
//  SpaceXViewModel.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 09/11/2021.
//

import Foundation
import Combine
import UIKit

protocol SpaceXViewModel {
    var hasNext: Bool { get }
    var headerTitle: String { get }
    var totalLaunchItems: Int { get }
    
    func getCompanyViewModel() -> CompanyViewModel?
    func getModel(at indexPath: IndexPath) -> LaunchItemViewModel?
    func fetchData(_ presenterView: SpaceXHomeView)
    func fetchLaunchItems(_ presenterView: SpaceXHomeView)
    func refreshOnFilter(_ years: [String], presenterView: SpaceXHomeView)
}

class SpaceXViewModelAdapter: SpaceXViewModel {
        
    var totalLaunchItems: Int {
        return launchItems.count
    }
    
    var headerTitle: String {
        return Constants.homeTitle
    }
    
    var hasNext: Bool = false
    
    private var page = 1
    
    private var companyModel: CompanyViewModel?
    private var launchItems: [LaunchItemViewModel] = []
    
    private let companyRepo: CompanyRepo
    private let rocketRepo: RocketRepo
    private let launchListRepo: LaunchListRepo
    
    private var companyCancellable: Cancellable?
    private var launchesCancellable: Cancellable?
    
    private var isFetching = false
    
    private var filterYears: [String] = []

    init(companyRepo: CompanyRepo,
         rocketRepo: RocketRepo,
         launchListRepo: LaunchListRepo) {
        self.companyRepo = companyRepo
        self.rocketRepo = rocketRepo
        self.launchListRepo = launchListRepo
    }
    
    func getModel(at indexPath: IndexPath) -> LaunchItemViewModel? {
        return launchItems[indexPath.row]
    }
    
    func getCompanyViewModel() -> CompanyViewModel? {
        return companyModel
    }
    
    func fetchData(_ presenterView: SpaceXHomeView) {
        fetchCompanyInfo(presenterView)
        fetchLaunchItems(presenterView)
    }
    
    func fetchLaunchItems(_ presenterView: SpaceXHomeView) {
     
        guard !isFetching else { return }
        
        isFetching.toggle()
        
        /// TODO Make request for `Rockets` using `RocketRepo` and combine on each LaunchItem
        
        launchesCancellable = launchListRepo
            .getLaunchList(for: queryAdapter)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                
                self?.isFetching = false
                
                switch completion {
                case .finished: break
                case let .failure(error):
                    presenterView.didLoadWithError(error)
                    break
                }
            }, receiveValue: { [weak self] reponseModel in
                
                guard let strongSelf = self else { return }
                
                var items: [LaunchItemViewModel] = reponseModel.docs.compactMap {
                    return LaunchItem(
                        lauch: $0,
                        rocket: Rocket(id: "Rocket", name: "Name", type: "Type")) {
                           // TODO: Article Page Navigation
                        } openWikiPediaClosure: {
                            // TODO: Wiki Page Navigation
                        } openVideoPagesClosure: {
                            // TODO: Video Pages Navigation
                        }
                }
                
                if strongSelf.filterYears.count > 0 {
                    items = items.filter({ strongSelf.filterYears.contains($0.yearTitle ?? "") })
                }
                
                strongSelf.launchItems.append(contentsOf: items)
                
                if strongSelf.page > 1 {
                    presenterView.onFetchCompleted(with: strongSelf.calculateIndexPathsToReload(from: items))
                } else {
                    presenterView.reloadTableView()
                }
                
                if reponseModel.hasNextPage == true {
                    strongSelf.page += 1
                }
                
                strongSelf.hasNext = reponseModel.hasNextPage
            })
    }

    private func fetchCompanyInfo(_ presenterView: SpaceXHomeView) {
        companyCancellable = companyRepo
            .getCompany()
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
    
    func refreshOnFilter(_ years: [String],
                         presenterView: SpaceXHomeView) {
        filterYears = years
        page = 1
        launchItems.removeAll()
        fetchLaunchItems(presenterView)
    }
    
    private var queryAdapter: LaunchListQueryAdapter {
        let adapter = LaunchListQueryAdapter(
            query: nil,
            options: LaunchListQueryAdapter.Options(
                limit: 10,
                page: page,
                sort: nil
            )
        )
        return adapter
    }
    
    private func calculateIndexPathsToReload(from newItems: [LaunchItemViewModel]) -> [IndexPath] {
        let startIndex = launchItems.count - newItems.count
        let endIndex = startIndex + newItems.count
        return (startIndex..<endIndex).map { IndexPath(row: $0, section: 1) }
    }
    
}
