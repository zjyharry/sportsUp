//
//  SecondRegisterViewController.swift
//  sportsUp
//
//  Created by Jiayi Zou on 11/29/17.
//  Copyright © 2017 Jiayi Zou. All rights reserved.
//

import UIKit

class SecondRegisterViewController: UIViewController {
    var userId = ""
    var password = ""
    let genders = ["male","female"]
    var genderInt = -1
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        emailTextField.delegate = self
        ageTextField.delegate = self
        genderTextField.delegate = self
        
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        
        genderTextField.inputView = picker
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BackButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func confirmButtonPressed(_ sender: UIButton) {
        let name = nameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let age = Int(ageTextField.text ?? "")
        let gender = genderTextField.text ?? ""
        //check
        if (name=="")||(email=="")||(ageTextField.text=="")||gender==nil{
            Tools.showNotification(title: "", context: "please fill all fields above", VC: self)
            return
        }
        if (age==nil)||(age!<0) {
            Tools.showNotification(title: "", context: "Invaild Age value, please try again", VC: self)
            return
        }
        
        if (!Tools.isValidEmail(testStr: email)){
            Tools.showNotification(title: "", context: "invaild email address, please try again", VC: self)
            return
        }
        
        let requestModel = RegisterRequestModel(userId: userId, password: password, gender: genderInt, name: name, email: email, age: age!)
        let requestJsonData = requestModel.toJsonData()
        
        //
        let urlString = "http://\(UserDefaults.standard.string(forKey: "IPADDRESS")!):8080/usercreator"
        let url = URL(string:urlString)!
        var request = URLRequest(url: url)
        request.timeoutInterval = 10
        request.httpMethod = "POST"
        request.httpBody = requestJsonData
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        var response:URLResponse?
        var responseModel:RegisterResponseModel
        do {
            let received =  try NSURLConnection.sendSynchronousRequest(request, returning: &response)
            print(String(data:received,encoding:.utf8))
            responseModel = try RegisterResponseModel.decodeFromJsonData(data: received)
        }
        catch{
            print(error.localizedDescription);
            #if !(DEBUG)
                Tools.showNotification(title: "Login Failed", context: "Connection error, please try again later.", VC: self)
                return
            #endif
        }
        //dummy response
        #if(DEBUG)
            let responseJson = "{\"statusCode\":1,\"}"
            responseModel = try! RegisterResponseModel.decodeFromJsonString(jsonString: responseJson)
        #endif
        if(responseModel.statusCode==1){
            let alert = UIAlertController(title: "", message: "Register success", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default){
                (UIAlertAction) -> Void in
                UserDefaults.standard.set(self.userId, forKey: "UserId")
                self.performSegue(withIdentifier: "registersuccessdelegate", sender: self)
            }
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        }else{
            //show warning page
            Tools.showNotification(title: "Register Failed", context: "0", VC: self)
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

extension SecondRegisterViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension SecondRegisterViewController:UIPickerViewDelegate,UIPickerViewDataSource{
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genders.count
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genders[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        genderTextField.text = genders[row]
        self.genderInt = row
    }
}

