//
//  SpaceXHomeView.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 12/11/2021.
//

import Foundation

protocol SpaceXHomeView: SpaceXView {
    func onFetchCompleted(with newIndexPathsToReload: [IndexPath]?)
    func openWikiPedia(url: String?)
    func openVidePage(url: String?)
    func openArticlePage(url: String?)
}
