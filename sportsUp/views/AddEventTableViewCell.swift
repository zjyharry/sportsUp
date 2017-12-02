//
//  AddEventTableViewCell.swift
//  sportsUp
//
//  Created by Jiayi Zou on 12/1/17.
//  Copyright © 2017 Jiayi Zou. All rights reserved.
//

import UIKit

class AddEventTableViewCell: UITableViewCell {
    var categray = ""
    var value = ""
    @IBOutlet weak var categrayLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    override func awakeFromNib() {
        categrayLabel.text = categray
        valueLabel.text = value
        
        super.awakeFromNib()
    }

}

