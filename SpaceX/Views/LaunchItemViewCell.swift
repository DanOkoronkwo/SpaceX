//
//  LaunchItemViewCell.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 11/11/2021.
//

import UIKit

class LaunchItemViewCell: UITableViewCell {

    @IBOutlet private var missionTitleLabel: UILabel?
    @IBOutlet private var daysTitleLabel: UILabel?
    @IBOutlet private var rocketTitleLabel: UILabel?
    @IBOutlet private var dateTimeTitleLabel: UILabel?
    
    @IBOutlet private var missionValueLabel: UILabel?
    @IBOutlet private var daysValueLabel: UILabel?
    @IBOutlet private var rocketValueLabel: UILabel?
    @IBOutlet private var dateTimeValueLabel: UILabel?
        
    @IBOutlet private var badgeImageView: UIImageView?
    @IBOutlet private var successIconView: UIImageView?

    func configureCell(with model: LaunchItemViewModel) {
        missionTitleLabel?.text = model.missionTitle
        missionValueLabel?.text = model.name
        
        daysTitleLabel?.text = model.daysFromOrToLaunchDate
        daysValueLabel?.text = model.launchDate
        
        rocketTitleLabel?.text = model.rocketTitle
        rocketValueLabel?.text = model.rocketDetail
        
        dateTimeTitleLabel?.text = model.dateTimeTitle
        dateTimeValueLabel?.text = model.launchDayInterval
        
        successIconView?.image = model.launchStatusIcon
    }
    
    override func prepareForReuse() {
        [missionTitleLabel,
         missionValueLabel,
         daysTitleLabel,
         daysValueLabel,
         rocketTitleLabel,
         rocketValueLabel,
         dateTimeTitleLabel,
         dateTimeValueLabel].forEach({ $0?.text = nil })
        
         successIconView?.image = nil
    }
    
}
