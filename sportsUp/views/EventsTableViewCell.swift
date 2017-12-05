//
//  EventsTableViewCell.swift
//  sportsUp
//
//  Created by Jiayi Zou on 11/29/17.
//  Copyright © 2017 Jiayi Zou. All rights reserved.
//

import UIKit
import MessageUI

class EventsTableViewCell: UITableViewCell {

    
    var model=EventDetailModel()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func shareButtonPressed(_ sender: Any) {
        let controller = MFMessageComposeViewController()
        let location = Tools.getStadium()
        var vc:UIResponder = self
        while vc.isKind(of: EventsTableViewController.self) != true {
            vc = vc.next!
        }
        let nvc = vc as! EventsTableViewController
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = nvc as! MFMailComposeViewControllerDelegate
            mail.setSubject("\(UserDefaults.standard.string(forKey: "UserId")!) invite you to join \(model.eventName)")
            mail.setMessageBody("Hi my friend:\nThis is an invitation from \(UserDefaults.standard.string(forKey: "UserId")!).\nThis event is \(model.eventName) at \((location[model.location]?.location)!)\nThe event time is \(model.startTime.replacingOccurrences(of: "T", with: " "))\n Hope to see you there!", isHTML: false)
            nvc.present(mail, animated: true, completion: nil)
        } else {
            
        }

        
        
        
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
