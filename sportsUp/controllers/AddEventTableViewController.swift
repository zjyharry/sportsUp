//
//  AddEventTableViewController.swift
//  sportsUp
//
//  Created by Jiayi Zou on 12/1/17.
//  Copyright © 2017 Jiayi Zou. All rights reserved.
//

import UIKit

//let requestModel = NewEventRequestModel(userId: "jiabin", newEvent: EventDetailModel(eventId: 1, location: 1, descr: "SU", startTime: Date(), endTime: Date(), classification: "123", capacity: 10, eventName: "hello"))

class AddEventTableViewController: UITableViewController {
    let category = ["Event Name","Location","Description","Start Time","End Time","Classification","Capacity"]
    var value = ["Event Name":"","locationInt":"","Location":"","Description":"","Start Time":"","End Time":"","Classification":"","Capacity":""]
    //let height = 44
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    @IBAction func submitButtonPressed(_ sender: Any) {
        let eventName = value["Event Name"]
        let locationInt = Int(value["locationInt"]!)
        let desc = value["Description"]
        let startTime = value["Start Time"]?.replacingOccurrences(of: " ", with: "T")
        let endTime = value["End Time"]?.replacingOccurrences(of: " ", with: "T")
        let classification = value["Classification"]
        let capacity = Int(value["Capacity"]!)
        
        
        //check
        if(eventName=="")||(locationInt==nil)||(desc=="")||(startTime=="")||(endTime=="")||(classification=="")||(capacity==nil)||(capacity!<0){
            Tools.showNotification(title: "", context: "Please check all rows in this page", VC: self)
            return
        }
        
        let requestModel = NewEventRequestModel(userId: UserDefaults.standard.string(forKey: "UserId")!, newEvent: EventDetailModel(eventId: -1, eventName: eventName!, location: locationInt!, startTimeString: startTime!, endTimeString: endTime!, capacity: capacity!, descr: desc!, classification: classification!))
        let requestJsonData = requestModel.toJsonData()
        let urlString = "http://\(UserDefaults.standard.string(forKey: "IPADDRESS")!):8080/event_creator"
        let url = URL(string:urlString)!
        var request = URLRequest(url: url)
        request.timeoutInterval = 10
        request.httpMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = requestJsonData
        var response:URLResponse?
        var responseModel:NewEventResponseModel
        do {
            let received =  try NSURLConnection.sendSynchronousRequest(request, returning: &response)
            print(String(data: received, encoding: .utf8))
            responseModel = try NewEventResponseModel.decodeFromJsonData(data: received)
        }
        catch{
            print(error.localizedDescription);
            #if !(DEBUG)
                Tools.showNotification(title: "Request Failed", context: "Connection error, please try again later.", VC: self)
                return
            #endif
        }
        //dummy result
        #if(DEBUG)
            let responseJson = "{\n\"statusCode\" : 1\n}"
            responseModel = try! LoginResponseModel.decodeFromJsonString(jsonString: responseJson)
        #endif
        if(responseModel.statusCode==1){
            Tools.showNotification(title: nil, context: "Request success", VC: self)
        }else if (responseModel.statusCode==501){
            Tools.showNotification(title: "Request Failed", context: "Stadium is full, please try again later", VC: self)
        }
        else{
            //show warning page
            Tools.showNotification(title: "Request Failed", context: "please try again later.", VC: self)
        }
        
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 7
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddEventTableViewCell", for: indexPath) as! AddEventTableViewCell
        cell.categray = category[indexPath.row]
        cell.value = value[category[indexPath.row]]!
        
        cell.categrayLabel.text = cell.categray
        cell.valueLabel.text = cell.value
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 44
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
        if(segue.identifier=="addEventDetailViewSegue"){
            let vc = segue.destination as! AddEventDetailViewController
            let cell = sender as! AddEventTableViewCell
            vc.categray = cell.categrayLabel.text!
            vc.value = cell.valueLabel.text!
        }
    }

}
