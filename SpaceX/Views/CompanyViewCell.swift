//
//  CompanyCell.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 11/11/2021.
//

import UIKit

class CompanyViewCell: UITableViewCell {
    
    func configureCell(model: CompanyViewModel?) {
        textLabel?.text = model?.companyDescription
        textLabel?.numberOfLines = 0
        textLabel?.textAlignment = .center
    }
    
}
