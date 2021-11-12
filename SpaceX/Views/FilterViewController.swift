//
//  FilterViewController.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 12/11/2021.
//

import UIKit

protocol FilterDelegate: AnyObject {
    func didSelectYears(_ years: [String])
}

class FilterViewController: UIViewController {

    @IBOutlet private var tableView: UITableView?
    @IBOutlet private var applyFilterButton: UIButton?

    private lazy var filterViewModel: FilterViewModel = {
        return FilterViewModelAdapter(
            launchListRepo: LaunchListProvider(
                httpClient: URLSessionHTTPClient(session: URLSession(configuration: .ephemeral)),
                baseUrl: Constants.baseURL
            )
        )
    }()
    
    private weak var filterDelegate: FilterDelegate?
    
    init(filterDelegate: FilterDelegate?) {
        self.filterDelegate = filterDelegate
        super.init(
            nibName: "FilterViewController",
            bundle: Bundle(for: FilterViewController.self)
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        filterViewModel.getLaunchYears(self)
        
        title = filterViewModel.headerTitle
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "CellIdentifier")
        
        applyFilterButton?.isEnabled = false
    }
   
    @IBAction private func didApplyFilter(sender: UIButton) {
        filterDelegate?.didSelectYears(filterViewModel.getChosenYears())
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - Table view data source
extension FilterViewController: UITableViewDataSource, UITableViewDelegate {
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterViewModel.totalLaunchItems
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        cell.textLabel?.text = filterViewModel.getYear(at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let year = filterViewModel.getYear(at: indexPath) else { return }
        
        if filterViewModel.hasChosenYear(year) {
            filterViewModel.removeYear(year)
        } else {
            filterViewModel.addYear(year)
        }
        
        let selectedCell = tableView.visibleCells[indexPath.row]
        selectedCell.selectionStyle = .none
        selectedCell.accessoryType = filterViewModel.hasChosenYear(year) ? .checkmark : .none
        
    }
}

// MARK: - FilterView Protocol
extension FilterViewController: FilterView {
    
    func reloadTableView() {
        applyFilterButton?.isEnabled.toggle()
        tableView?.reloadData()
    }

}

