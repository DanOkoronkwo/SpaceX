//
//  HomeViewController.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 08/11/2021.
//

import UIKit
import Lottie

class HomeViewController: UIViewController {
    
    private var tableView: UITableView?

    private let viewModel: SpaceXViewModel
    
    init(viewModel: SpaceXViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "HomeViewController", bundle: Bundle(for: HomeViewController.self))
        self.title = Constants.homeTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.fetchData(self)
    }

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}


extension HomeViewController: SpaceXView {
    
    func showLoading() {
        
    }
    
    func showNoItemsAvailable() {
        
    }
    
    func didLoadWithError(_ error: Error) {
        
    }
}
