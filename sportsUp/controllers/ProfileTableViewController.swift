//
//  ProfileTableViewController.swift
//  sportsUp
//
//  Created by Jiayi Zou on 12/2/17.
//  Copyright © 2017 Jiayi Zou. All rights reserved.
//

import UIKit

class ProfileTableViewController: UITableViewController {
    var userModel = UserModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        getSelfProfile()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
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

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }
    
    func getSelfProfile(){
        let userId = UserDefaults.standard.string(forKey: "UserId")!
        let urlString = "http://\(UserDefaults.standard.string(forKey: "IPADDRESS")!):8080/userprofile"
        let url = URL(string: urlString)
        let requestModel = GetUserRequestModel(userId:userId)
        let requestJsonData = requestModel.toJsonData()
        var request = URLRequest(url: url!)
        request.timeoutInterval = 10
        request.httpMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = requestJsonData
        var response:URLResponse?
        var responseModel:UserModel
        do {
            let received =  try NSURLConnection.sendSynchronousRequest(request, returning: &response)
            print(String(data: received, encoding: .utf8))
            responseModel = try UserModel.decodeFromJsonData(data: received)
            self.userModel = responseModel
            self.setNeedsFocusUpdate()
        } catch {
            print(error.localizedDescription);
        }
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profiletableviewcell", for: indexPath) as! ProfileTableViewCell
        switch indexPath.row {
        case 0:
            cell.keyLabel.text = "UserName"
            cell.valueLabel.text = self.userModel.userId
        case 1:
            cell.keyLabel.text = "age"
            cell.valueLabel.text = "20"
        case 2:
            cell.keyLabel.text = "gender"
            cell.valueLabel.text = self.userModel.gender==0 ? "male":"female"
        case 3:
            cell.keyLabel.text = "email"
            cell.valueLabel.text = self.userModel.email
        default:
            break
        }
        // Configure the cell...

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
