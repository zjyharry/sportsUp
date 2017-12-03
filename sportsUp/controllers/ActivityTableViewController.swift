//
//  ActivityTableViewController.swift
//  sportsUp
//
//  Created by Jiayi Zou on 11/29/17.
//  Copyright © 2017 Jiayi Zou. All rights reserved.
//

import UIKit
import MessageUI
class ActivityTableViewController: UITableViewController {
    var heightCache =  [Int]()
    let imageDic:[String:UIImage]=["basketball":#imageLiteral(resourceName: "basketBallImage"),"soccer":#imageLiteral(resourceName: "12副本"),"football":#imageLiteral(resourceName: "footballImage")]
    let touxiangDic :[UIImage]=[#imageLiteral(resourceName: "stanford"),#imageLiteral(resourceName: "princeton"),#imageLiteral(resourceName: "yale"),#imageLiteral(resourceName: "penn"),#imageLiteral(resourceName: "harvard"),#imageLiteral(resourceName: "maryland"),#imageLiteral(resourceName: "usc"),#imageLiteral(resourceName: "Columbia"),#imageLiteral(resourceName: "georgetown"),#imageLiteral(resourceName: "su"),#imageLiteral(resourceName: "cornell"),#imageLiteral(resourceName: "Duke"),#imageLiteral(resourceName: "Bostoncollege"),#imageLiteral(resourceName: "Columbia"),]
    var activities = [EventDetailModel]()
    let location = Tools.getStadium()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = UIColor.lightGray
        //self.tabBarController?.tabBar.isHidden = false
        self.getActivities()
        //self.tableView.estimatedRowHeight = 180
        //self.tableView.rowHeight = UITableViewAutomaticDimension
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        self.title = "Activity"
        self.tableView.reloadData()
        self.tabBarController?.tabBar.isHidden = false
        //self.tabBarController?.tabBar.tintColor = UIColor(red: 96, green: 126, blue: 183, alpha: 1)
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return activities.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AvtivityTableViewCell", for: indexPath) as! ActivityTableViewCell
        //cell.attendButton.isHidden = false
        //cell.interestedButton.isHidden = false
        cell.index = indexPath.row
        cell.layer.borderWidth = 2
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.clipsToBounds = true
        //cell.layer.cornerRadius = 8
        // Configure the cell...
        let activity = activities[indexPath.row]
        cell.model = activity
        //cell.contentLabel.text = activity.eventName
        cell.titleLabel.text = activity.eventName
        cell.locationLabel.text = location[activity.location]?.location
        //cell.contentLabel.text = activity.descr
        cell.startTimeLabel.text = activity.startTime.replacingOccurrences(of: "T", with: " ")
        cell.entTimeLabel.text = activity.endTime.replacingOccurrences(of: "T", with: " ")
        cell.touxiangImageView.image = touxiangDic[indexPath.row % 13]
        cell.eventImage.image = imageDic[activity.classification]
        //cell.touxiangImageView.layer.borderWidth = 1
        //cell.touxiangImageView.layer.borderColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 242/255.0, alpha: 1.0).cgColor
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(heightCache[indexPath.row])
    }
    
    func getActivities(){
        let requestModel = EventListRequestModel(count: 10, userId: UserDefaults.standard.string(forKey: "UserId")!)
        let requestData = requestModel.toJsonData()
        let urlString = "http://\(UserDefaults.standard.string(forKey: "IPADDRESS")!):8080/allevent"
        let url = URL(string:urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = requestData
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 10
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request,
                                        completionHandler: {
                                            (data, response, serror) -> Void in
                                            if serror != nil{
                                            print(serror?.localizedDescription)
                                            //dummy data
//                                            let dummyEvent = EventDetailModel(eventId: 1, location: 1, descr: "this is a dummy data", startTime: Date(), endTime: Date(),capacity: 10, classification:"football", eventName: "dummy data", users: [UserModel(userId: "jw", name: "tian you", gender: 1, age: 1)])
//                                            let dummyEvent2 = EventDetailModel(eventId: 2, location: 2, descr: "this is another dummy data", startTime: Date(), endTime: Date(),capacity: 10, classification:"football", eventName: "dummy data 2", users: [UserModel(userId: "jw", name: "tian you", gender: 1, age: 1)])
//                                            let dummyModel = EventListResponseModel(count: 1, eventList: [dummyEvent,dummyEvent2])
//                                            let dummyJsonString = dummyModel.toJsonString()
//                                            let dummyData = dummyJsonString.data(using: .utf8)
                                            }
                                            else
                                            {
                                                print(String(data: data!, encoding: .utf8)!   )
                                            let responseModel = try! EventListResponseModel.decodeFromJsonData(data:data!)
                                            self.activities = responseModel.eventList
                                            DispatchQueue.main.async {
                                                self.heightCache = [Int](repeating: 419, count: self.activities.count)
                                                self.tableView.reloadData()
                                            }
                                            }
        })
        dataTask.resume()
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EventDetailViewSegue" {
            let controller = segue.destination as! EventDetailViewController
            controller.model = (sender as! ActivityTableViewCell).model
        }
        
        
    }
}

extension ActivityTableViewController:MFMailComposeViewControllerDelegate{
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
