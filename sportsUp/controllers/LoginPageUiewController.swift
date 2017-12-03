//
//  LoginPageUiewControllerViewController.swift
//  sportsUp
//
//  Created by Jiayi Zou on 11/28/17.
//  Copyright © 2017 Jiayi Zou. All rights reserved.
//

import UIKit

class LoginPageUiewController: UIViewController {

    @IBOutlet weak var userIdTextField: UITextField!
    @IBOutlet weak var passWdTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userIdTextField.delegate = self
        passWdTextField.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if(UserDefaults.standard.string(forKey: "UserId") != nil){
            self.performSegue(withIdentifier: "LoginSuccessSegue", sender: nil)
        }
    }
    
    @IBAction func LoginButtonPressed(_ sender: UIButton) {
        let userId = userIdTextField.text
        let passWd = passWdTextField.text
        if (userId=="")||(passWd==""){
            Tools.showNotification(title: nil, context: "UserId or Password cannot be empty", VC: self)
        }
        else{
            //let requestModel = NewEventRequestModel(userId: "jiabin", newEvent: EventDetailModel(eventId: 1, location: 1, descr: "SU", startTime: Date(), endTime: Date(), classification: "123", capacity: 10, eventName: "hello"))
            let requestModel = LoginRequestModel(userId: userId!, passWd: passWd!)
            let requestJsonData = requestModel.toJsonData()
            let urlString = "http://\(UserDefaults.standard.string(forKey: "IPADDRESS")!):8080/usersignin"
            let url = URL(string:urlString)!
            var request = URLRequest(url: url)
            request.timeoutInterval = 10
            request.httpMethod = "POST"
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            request.httpBody = requestJsonData
            var response:URLResponse?
            var responseModel:LoginResponseModel
            do {
                let received =  try NSURLConnection.sendSynchronousRequest(request, returning: &response)
                print(String(data: received, encoding: .utf8))
                responseModel = try LoginResponseModel.decodeFromJsonData(data: received)
            }
            catch{
                print(error.localizedDescription);
                #if !(DEBUG)
                Tools.showNotification(title: "Login Failed", context: "Connection error, please try again later.", VC: self)
                return
                #endif
            }
            //dummy result
            #if(DEBUG)
                let responseJson = "{\n\"statusCode\" : 1\n}"
                responseModel = try! LoginResponseModel.decodeFromJsonString(jsonString: responseJson)
            #endif
            if(responseModel.statusCode==1){
                //jump to next page
                UserDefaults.standard.set(userId, forKey: "UserId")
                self.performSegue(withIdentifier: "LoginSuccessSegue", sender: nil)
            }else{
                //show warning page
                Tools.showNotification(title: "Login Failed", context: "The userId and password you provided is not match our record, please try again.", VC: self)
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

extension LoginPageUiewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
