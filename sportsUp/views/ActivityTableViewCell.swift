//
//  ActivityTableViewCell.swift
//  sportsUp
//
//  Created by Jiayi Zou on 11/29/17.
//  Copyright © 2017 Jiayi Zou. All rights reserved.
//

import UIKit
import MessageUI

class ActivityTableViewCell: UITableViewCell {
    var index = -1
    var eventId = -1
    var model = EventDetailModel()
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var touxiangImageView: UIImageView!
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var entTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func hideButtonPressed(_ sender: Any) {
//        var vc:UIResponder = self
//        while vc.isKind(of: ActivityTableViewController.self) != true {
//            vc = vc.next!
//        }
//        let nvc = vc as! ActivityTableViewController
//        nvc.heightCache[index]=0
//        nvc.tableView.reloadData()
    }
    
    @IBAction func attendButtonPressed(_ sender: Any) {
        let userId = UserDefaults.standard.string(forKey: "UserId")!
        let requestModel = EnrollEventRequestModel(userId: userId, eventId: model.eventId)
        let urlString = "http://\(UserDefaults.standard.string(forKey: "IPADDRESS")!):8080/event_join"
        let url = URL(string:urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = requestModel.toJsonData()
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request,
                                        completionHandler: {
                                            (data, response, serror) -> Void in
                                            if serror != nil{
                                                print(serror?.localizedDescription)
                                            }
                                            do{
                                                var responseModel = try? EnrollEventResponseModel.decodeFromJsonData(data:data ?? Data())
                                                #if(DEBUG)
                                                    responseModel = EnrollEventResponseModel(statusCode: 1)
                                                #endif
                                                DispatchQueue.main.async {
                                                    var vc:UIResponder = self
                                                    while vc.isKind(of: ActivityTableViewController.self) != true {
                                                        vc = vc.next!
                                                    }
                                                    let nvc = vc as! ActivityTableViewController
                                                    if responseModel?.statusCode == 1 {
                                                        Tools.showNotification(title: "", context: "Enroll success.", VC: nvc)
                                                    }else{
                                                        Tools.showNotification(title: "", context: "Enroll failed, please try again later.", VC: nvc)
                                                    }
                                                }
                                            }
                                            
        })
        dataTask.resume()
    }
    
    @IBAction func shareButtonPressed(_ sender: Any) {
        let controller = MFMessageComposeViewController()
        var vc:UIResponder = self
        while vc.isKind(of: ActivityTableViewController.self) != true {
            vc = vc.next!
        }
        let nvc = vc as! ActivityTableViewController
        
    }
    
    
}
