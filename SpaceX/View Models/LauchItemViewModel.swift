//
//  LauchItemViewModel.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 08/11/2021.
//

import Foundation

protocol LaunchItemViewModel {
    var hasSuccessed: Bool { get }
    var name: String { get }
    var launchDate: String { get }
    var rocketDetail: String { get }
    var daysFromOrToLaunchDate: String { get }
    var launchDayInterval: String { get }
}

struct LaunchItem: LaunchItemViewModel {
    
    private let launch: Launch
    private let rocket: Rocket
    
    init(lauch: Launch,
         rocket: Rocket) {
        self.launch = lauch
        self.rocket = rocket
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
