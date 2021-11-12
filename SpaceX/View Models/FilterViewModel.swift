//
//  FilterViewModel.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 12/11/2021.
//

import Foundation
import Combine

protocol FilterViewModel {
    var headerTitle: String { get }
    var totalLaunchItems: Int { get }
    func getLaunchYears(_ presenterView: FilterView)
    func getYear(at indexPath: IndexPath) -> String?
    func addYear(_ year: String)
    func removeYear(_ year: String)
    func getChosenYears() -> [String]
    func hasChosenYear(_ year: String) -> Bool
}

protocol FilterView: SpaceXView {}

class FilterViewModelAdapter {
    
    private var cancellable: Cancellable?
    private let launchListRepo: LaunchListRepo
    private var launchYears: [String] = []
    private var selectedLaunchYears: [String] = []
    
    init(launchListRepo: LaunchListRepo) {
        self.launchListRepo = launchListRepo
    }
    
}

extension FilterViewModelAdapter: FilterViewModel {

    var headerTitle: String {
        return Constants.filterByYear
    }
    
    var totalLaunchItems: Int {
        return launchYears.count
    }
    
    func getYear(at indexPath: IndexPath) -> String? {
        return launchYears[indexPath.row]
    }
    
    func getLaunchYears(_ presenterView: FilterView) {
        
        presenterView.showLoading()
        
        cancellable = launchListRepo
            .getAllLaunches()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished: break
                case .failure(_):
                    presenterView.didLoadWithError(Constants.networkErrorMessage)
                    break
                }
            }, receiveValue: { [weak self] launchList in
                
              
                let items: [String] = Array(Set(launchList.compactMap {
                    return DateProvider.dateToYear(DateProvider.formatRemoteDate($0.date))
                }.compactMap{ $0 })).sorted(by: < )
                
                self?.launchYears = items
                
                if self?.launchYears.isEmpty == true {
                    presenterView.showNoItemsAvailable(Constants.noItemsAvailable)
                }
                
                presenterView.reloadTableView()
            })
    }
    
    func addYear(_ year: String) {
        selectedLaunchYears.append(year)
    }
    
    func getChosenYears() -> [String] {
        return selectedLaunchYears
    }
    
    func hasChosenYear(_ year: String) -> Bool {
        return selectedLaunchYears.contains(year)
    }
    
    func removeYear(_ year: String) {
        guard let index = selectedLaunchYears.firstIndex(of: year) else { return }
        selectedLaunchYears.remove(at: index)
    }
    

}
