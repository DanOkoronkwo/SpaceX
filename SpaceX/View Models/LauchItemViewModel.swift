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

struct LaunchItem {
    
    private let launch: Launch
    private let rocket: Rocket
    
    init(lauch: Launch,
         rocket: Rocket) {
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
        return launch.success
    }
    
    var name: String {
        return launch.name
    }
    
    var launchDate: String {
        return DateProvider.formatDate(launch.date) ?? "N/L"
    }
    
    var rocketDetail: String {
        return "\(rocket.name) / \(rocket.type)"
    }
    
    var daysFromOrToLaunchDate: String {
        let isFuture = DateProvider.isFutureDate(launch.date) ?? false
        return "Days \(isFuture ? "from" : "since") now"
    }
    
    var launchDayInterval: String {
        let todaysDateString = DateProvider.currentDate()
        let launchDateString = DateProvider.formatDate(launch.date) ?? "N/L"
        return "+/- \(todaysDateString) - \(launchDateString)"
    }
}
