//
//  NYCSchoolTableViewCell.swift
//  NYCSchools
//
//  Created by Manish Chaturvedi on 10/23/22.
//  Copyright © 2022 Manish Chaturvedi. All rights reserved.
//

import UIKit

class NYCSchoolTableViewCell: UITableViewCell {
    
    static let identifier = "NYCSchoolTableViewCell"
    
    @IBOutlet weak var schoolNameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var navigateButton: UIButton!

    var school: NYCSchool! {
        didSet {
            schoolNameLabel.text = school.school_name
            if let city = school.city, let code = school.state_code, let zip = school.zip{
                cityLabel.text = "\(city), \(code), \(zip)"
            }
        }
    }
}
