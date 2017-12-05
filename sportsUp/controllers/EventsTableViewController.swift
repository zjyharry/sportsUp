//
//  EventsTableViewController.swift
//  sportsUp
//
//  Created by Jiayi Zou on 11/29/17.
//  Copyright © 2017 Jiayi Zou. All rights reserved.
//

import UIKit
import MessageUI

class EventsTableViewController: UITableViewController {
    var events = [EventDetailModel]()
    let imageDic = [String:UIImage]()
    let touxiangDic = [String:UIImage]()
    let location = Tools.getStadium()
    var months = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tabBarController?.tabBar.isHidden = false
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
        self.title = "My Events"
        getEvents()
        self.tabBarController?.tabBar.isHidden = false
        //self.tabBarController?.tabBar.col = UIColor(red: 96, green: 126, blue: 183, alpha: 1)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return events.count
    }
    
    func getEvents(){
        let requestModel = EventListRequestModel(count: 10, userId: UserDefaults.standard.string(forKey: "UserId")!)
        let requestData = requestModel.toJsonData()
        let urlString = "http://\(UserDefaults.standard.string(forKey: "IPADDRESS")!):8080/myevent"
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
                                                let responseModel = try! EventListResponseModel.decodeFromJsonData(data:data!)
                                                self.events = responseModel.eventList
                                                DispatchQueue.main.async {
                                                    //self.heightCache = [Int](repeating: 285, count: self.activities.count)
                                                    self.tableView.reloadData()
                                                }
                                            }
        })
        dataTask.resume()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "EventsTableViewCell", for: indexPath) as! EventsTableViewCell
//        cell.eventDetailModel = self.events[indexPath.row]
//        cell.nameLabel.text = self.events[indexPath.row].eventName
//        cell.desLabel.text = self.events[indexPath.row].descr
//        return cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventTableViewCell", for: indexPath) as! EventsTableViewCell
        //cell.attendButton.isHidden = true
        //cell.interestedButton.isHidden = true
        //cell.layer.borderWidth = 2
        //cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.clipsToBounds = true
        //cell.layer.cornerRadius = 8
        // Configure the cell...
        let activity = events[indexPath.row]
        cell.model = activity
        //cell.titleLabel.text = activity.eventName
        cell.locationLabel.text = location[activity.location]?.location
        cell.titleLabel.text = activity.eventName
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd'T'hh:mm:ss"
        let startDate = dateFormatter.date(from: activity.startTime)
        let cal = Calendar.current
        cell.dateLabel.text = "\(cal.component(.day, from: startDate!))"
        cell.monthLabel.text = months[cal.component(.month, from: startDate!)-1]

        //cell.contentLabel.text = activity.descr
        //cell.startTimeLabel.text = activity.startTime.replacingOccurrences(of: "T", with: " ")
        //cell.entTimeLabel.text = activity.endTime.replacingOccurrences(of: "T", with: " ")
        //cell.touxiangImageView.image = touxiangDic[activity.classification]
        //cell.eventImage.image = imageDic[activity.classification]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        //unroll
        let requestModel = UnrollEventRequestModel(userId: UserDefaults.standard.string(forKey: "UserId")!, eventId: events[indexPath.row].eventId)
        let requestJsonData = requestModel.toJsonData()
        let urlString = "http://\(UserDefaults.standard.string(forKey: "IPADDRESS")!):8080/event_exit"
        let url = URL(string:urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = requestJsonData
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 10
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request,
                                        completionHandler: {
                                            (data, response, serror) -> Void in
                                            if serror != nil{
                                                print(serror?.localizedDescription)
                                                Tools.showNotification(title: "Request failed", context: "Please try again later", VC: self)
                                            }
                                            else
                                            {
                                                let responseModel = try! UnrollEventResponseModel.decodeFromJsonData(data:data!)
                                                print(responseModel.toJsonString())
                                                if(responseModel.statusCode==1){
                                                    DispatchQueue.main.async {
                                                        self.events.remove(at: indexPath.row)
                                                        self.tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.top);
                                                        Tools.showNotification(title: "Success", context: "You successfully unroll this event", VC: self)
                                                        return
                                                    }
                                                }else{
                                                    Tools.showNotification(title: "Request failed", context: "Please try again later", VC: self)
                                                }
                                                
                                            }
                                            
        })
        dataTask.resume()
    }
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "unroll"
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EventDetailViewSegue" {
            let controller = segue.destination as! EventDetailViewController
            controller.model = (sender as! EventsTableViewCell).model
        }
    }
 

}

extension EventsTableViewController:MFMailComposeViewControllerDelegate{
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
