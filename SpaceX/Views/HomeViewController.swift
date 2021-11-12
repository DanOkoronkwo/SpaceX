//
//  HomeViewController.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 08/11/2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet private var tableView: UITableView?

    private var alertPresented = false
    private let viewModel: SpaceXViewModel
    
    private lazy var alert = UIAlertController(
        title: "Filter & Sort",
        message: nil,
        preferredStyle: .actionSheet
    )
    
    private lazy var filterButton = UIBarButtonItem(
        image: UIImage(named: "sort_Icon"),
        style: .plain,
        target: self,
        action: #selector(self.rightButtonAction)
    )
    
    init(viewModel: SpaceXViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "HomeViewController", bundle: Bundle(for: HomeViewController.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func rightButtonAction(sender: UIBarButtonItem) {
        displayFilterAlert()
    }
    
    private func setupDialog() {
        alert.addAction(
            UIAlertAction(
                title: Constants.filterByYear,
                style: UIAlertAction.Style.default, handler: { [weak self] action in
                    self?.alertPresented.toggle()
                    self?.navigateToFilter()
        }))
        
        alert.addAction(
            UIAlertAction(
                title: Constants.sort,
                style: UIAlertAction.Style.default, handler: {[weak self] action in
                    self?.alertPresented.toggle()
        }))
        
        alert.addAction(
            UIAlertAction(
                title: Constants.cancel,
                style: UIAlertAction.Style.default, handler: { action in
                    
        }))
    }
    
    private func displayFilterAlert() {
        if !alertPresented {
            present(alert, animated: true, completion: nil)
            alertPresented.toggle()
        } else {
            alert.dismiss(animated: true, completion: nil)
            alertPresented.toggle()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.fetchData(self)
        
        self.navigationItem.setRightBarButton(filterButton, animated: false)
        
        configureUI()
        configureTableView()
        setupDialog()
    }
    
    private func configureUI() {
        self.title = viewModel.headerTitle
    }

    private func configureTableView() {
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.prefetchDataSource = self
        
        tableView?.register(
            CompanyViewCell.self,
            forCellReuseIdentifier: Constants.CompanyDescriptionCell
        )
        
        tableView?.register(
            UINib(nibName: "LaunchItemViewCell", bundle: nil),
            forCellReuseIdentifier: Constants.LaunchItemCell
        )
    }
    
    private func navigateToFilter() {
        let filterViewController = FilterViewController(filterDelegate: self)
        self.navigationController?.pushViewController(filterViewController, animated: true)
    }
    
    func isLoadingCell(for indexPath: IndexPath) -> Bool {
        return indexPath.row >= (viewModel.totalLaunchItems - 1)
    }
    
    func visibleIndexPathsToReload(intersecting indexPaths: [IndexPath]) -> [IndexPath] {
        let indexPathsForVisibleRows = tableView?.indexPathsForVisibleRows ?? []
        let indexPathsIntersection = Set(indexPathsForVisibleRows).intersection(indexPaths)
        return Array(indexPathsIntersection)
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return Constants.company
        }
        return Constants.launches
    }
    
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
            cell.configureCell(with: viewModel.getCompanyViewModel())
            return cell
        }
        
        guard indexPath.section == 1,
              let cell = tableView.dequeueReusableCell(withIdentifier: Constants.LaunchItemCell) as? LaunchItemViewCell,
              let model = viewModel.getModel(at: indexPath) else {
            return UITableViewCell()
        }
        
        cell.configureCell(with: model)
        return cell
    }
}


extension HomeViewController: UITableViewDataSourcePrefetching {
 
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        if indexPaths.contains(where: isLoadingCell) && viewModel.hasNext {
            viewModel.fetchLaunchItems(self)
        }
    }
    
}

extension HomeViewController: SpaceXHomeView {
    func openWikiPedia(url: String?) {
        // TODO
    }
    
    func openVidePage(url: String?) {
        // TODO
    }
    
    func openArticlePage(url: String?) {
        // TODO
    }
    
    func onFetchCompleted(with newIndexPathsToReload: [IndexPath]?) {
        guard let newIndexPathsToReload = newIndexPathsToReload else {
            tableView?.reloadData()
            return
        }
        
        tableView?.beginUpdates()
        tableView?.insertRows(at: newIndexPathsToReload, with: .automatic)
        tableView?.endUpdates()
    }
    
    func reloadTableView() {
        tableView?.reloadData()
    }
    
}

extension HomeViewController: FilterDelegate {
    
    func didSelectYears(_ years: [String]) {
        viewModel.refreshOnFilter(years, presenterView: self)
    }

}

