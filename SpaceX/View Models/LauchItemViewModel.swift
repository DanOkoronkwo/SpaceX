//
//  LauchItemViewModel.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 08/11/2021.
//

import Foundation
import UIKit

protocol LaunchItemViewModel {
    var hasSuccessed: Bool { get }
    var name: String { get }
    var launchDate: String { get }
    var rocketDetail: String { get }
    var daysFromOrToLaunchDate: String { get }
    var launchDayInterval: String { get }
    var launchStatusIcon: UIImage? { get }
    
    var missionTitle: String { get }
    var rocketTitle: String { get }
    var dateTimeTitle: String { get }
}

protocol FilterItemViewModel {
    var yearTitle: String? { get }
}

struct LaunchItem {
    
    private let launch: Launch
    private let rocket: Rocket?
    
    init(lauch: Launch,
         rocket: Rocket? = nil) {
        self.launch = lauch
        self.rocket = rocket
    }
    
}

extension LaunchItem: LaunchItemViewModel {
    
    var launchStatusIcon: UIImage? {
        return hasSuccessed ? UIImage(named: "success_Icon") : UIImage(named: "failure_Icon")
    }
    
    var missionTitle: String {
        return Constants.missionTitle
    }
    
    var rocketTitle: String {
        return Constants.rocketTitle
    }
    
    var dateTimeTitle: String {
        return Constants.dateTimeTitle
    }

    var hasSuccessed: Bool {
        return launch.success ?? false
    }
    
    var name: String {
        return launch.name
    }
    
    var launchDate: String {
        guard let formattedISODate = DateProvider.formatRemoteDate(launch.date),
              let date = DateProvider.formatDate(formattedISODate) else {
                  return "N/L"
        }
        return date
    }
    
    var rocketDetail: String {
        guard let rocket = self.rocket else { return "N/L" }
        return "\(rocket.name) / \(rocket.type)"
    }
    
    var daysFromOrToLaunchDate: String {
        let isFuture = DateProvider.isFutureDate(launch.date) ?? false
        return "Days \(isFuture ? "from" : "since") now"
    }
    
    var launchDayInterval: String {
        guard let todaysDateString = DateProvider.formatDate(DateProvider.date),
              let formattedLaunchISODate = DateProvider.formatRemoteDate(launch.date),
              let launchDate = DateProvider.formatDate(formattedLaunchISODate) else {
                  return "N/L"
              }
        return "+/- \(todaysDateString) - \(launchDate)"
    }
}

extension LaunchItem: FilterItemViewModel {
    
    var yearTitle: String? {
        return DateProvider.dateToYear(DateProvider.formatRemoteDate(launch.date))
    }
}
