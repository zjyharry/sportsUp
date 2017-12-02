//
//  EventsTableViewController.swift
//  sportsUp
//
//  Created by Jiayi Zou on 11/29/17.
//  Copyright © 2017 Jiayi Zou. All rights reserved.
//

import UIKit

class EventsTableViewController: UITableViewController {
    var events = [EventDetailModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tabBarController?.tabBar.isHidden = false
        getEvents()
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
        self.tabBarController?.tabBar.isHidden = false
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
        let urlString = "http://127.0.0.1"
        let url = URL(string:urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request,
                                        completionHandler: {
                                            (data, response, serror) -> Void in
                                            //if serror != nil{
                                                //print(serror?.localizedDescription)
                                                //dummy data
                                            let dummyEvent = EventDetailModel(eventId: 1, location: 1, descr: "this is a dummy data", startTime: Date(), endTime: Date(),capacity: 10, classification:"football", eventName: "dummy data", users: [UserModel(userId: "jw", name: "tian you", gender: 1, age: 1)])
                                            let dummyEvent2 = EventDetailModel(eventId: 2, location: 2, descr: "this is another dummy data", startTime: Date(), endTime: Date(),capacity: 10, classification:"football", eventName: "dummy data 2", users: [UserModel(userId: "jw", name: "tian you", gender: 1, age: 1)])
                                                let dummyModel = EventListResponseModel(count: 1, eventList: [dummyEvent,dummyEvent2])
                                                let dummyJsonString = dummyModel.toJsonString()
                                                let dummyData = dummyJsonString.data(using: .utf8)
                                            //}
                                            //else
                                            //{
                                                let responseModel = try! EventListResponseModel.decodeFromJsonData(data:dummyData!)
                                                self.events = responseModel.eventList
                                                DispatchQueue.main.async {
                                                    self.tableView.reloadData()
                                                    //print(self.events)
                                                }
                                            //}
        })
        dataTask.resume()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventsTableViewCell", for: indexPath) as! EventsTableViewCell
        cell.eventDetailModel = self.events[indexPath.row]
        cell.nameLabel.text = self.events[indexPath.row].eventName
        cell.desLabel.text = self.events[indexPath.row].descr

        

        return cell
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
            controller.model = (sender as! EventsTableViewCell).eventDetailModel
        }
    }
 

}
