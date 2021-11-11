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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(model: LaunchItemViewModel) {
        missionTitleLabel?.text = model.missionTitle
        missionValueLabel?.text = model.name
        
        daysTitleLabel?.text = model.daysFromOrToLaunchDate
        daysValueLabel?.text = model.launchDayInterval
        
        rocketTitleLabel?.text = model.rocketTitle
        rocketValueLabel?.text = model.rocketDetail
        
        dateTimeTitleLabel?.text = model.dateTimeTitle
        dateTimeValueLabel?.text = model.launchDate
        
        successIconView?.image = model.launchStatusIcon
    }
    
}
