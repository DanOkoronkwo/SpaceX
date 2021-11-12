//
//  LaunchView.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 09/11/2021.
//

import Foundation

protocol SpaceXView {
    func reloadTableView()
    func showLoading()
    func showNoItemsAvailable()
    func didLoadWithError(_ error: Error)
}

extension SpaceXView {
    
    func showLoading() {
        // TODO: Show Loading Spinner
    }
    
    func showNoItemsAvailable() {
        // TODO: Show No Items available alert
    }
    
    func didLoadWithError(_ error: Error) {
        // TODO: Handle Error
    }

}
