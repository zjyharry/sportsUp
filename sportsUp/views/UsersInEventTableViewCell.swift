//
//  UsersInEventTableViewCell.swift
//  sportsUp
//
//  Created by Jiayi Zou on 12/2/17.
//  Copyright © 2017 Jiayi Zou. All rights reserved.
//

import UIKit

class UsersInEventTableViewCell: UITableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var genderImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
