//
//  HomeViewController.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 08/11/2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet private var tableView: UITableView?

    private let viewModel: SpaceXViewModel
    
    init(viewModel: SpaceXViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "HomeViewController", bundle: Bundle(for: HomeViewController.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.fetchData(self)
        
        configureUI()
        configureTableView()
    }
    
    private func configureUI() {
        self.title = Constants.homeTitle
    }

    private func configureTableView() {
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.register(CompanyViewCell.self, forCellReuseIdentifier: Constants.CompanyDescriptionCell)
        tableView?.register(LaunchItemViewCell.self, forCellReuseIdentifier: Constants.LaunchItemCell)
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
        return viewModel.totalLaunchItems
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CompanyDescriptionCell) as? CompanyViewCell else {
                return UITableViewCell()
            }
            cell.configureCell(model: viewModel.getCompanyViewModel())
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.LaunchItemCell) as? LaunchItemViewCell,
            let model = viewModel.getModel(at: indexPath) else {
            return UITableViewCell()
        }
        
        cell.configure(model: model)
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
    
    func reloadTableView() {
        tableView?.reloadData()
    }
}
