//
//  LaunchView.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 09/11/2021.
//

import Foundation

protocol SpaceXView: AnyObject {
    func reloadTableView()
    func showLoading()
    func showNoItemsAvailable()
    func didLoadWithError(_ error: Error)
}
