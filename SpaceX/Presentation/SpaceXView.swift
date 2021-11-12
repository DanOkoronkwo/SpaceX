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
    func showNoItemsAvailable(_ message: String)
    func didLoadWithError(_ message: String)
}
