//
//  RegisterViewController.swift
//  sportsUp
//
//  Created by Jiayi Zou on 11/28/17.
//  Copyright © 2017 Jiayi Zou. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var userIdTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var comfirmPasswordTextField: UITextField!
    //@IBOutlet weak var nameTextField: UITextField!
    //@IBOutlet weak var emailTextField: UITextField!
    //@IBOutlet weak var ageTextField: UITextField!
    //@IBOutlet weak var genderTextField: UITextField!
    
    //let genders = ["male","female"]
    var genderInt = -1
    override func viewDidLoad() {
        super.viewDidLoad()
        userIdTextField.delegate = self
        passwordTextField.delegate = self
//        comfirmPasswordTextField.delegate = self
//        nameTextField.delegate = self
//        emailTextField.delegate = self
//        ageTextField.delegate = self
        
//        let picker = UIPickerView()
//        picker.delegate = self
//        picker.dataSource = self
//        genderTextField.inputView = picker
//        genderTextField.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func RegisterButtonPressed(_ sender: Any) {
        let userId = userIdTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let cPassword = comfirmPasswordTextField.text ?? ""
//        let name = nameTextField.text ?? ""
//        let email = emailTextField.text ?? ""
//        let age = Int(ageTextField.text ?? "")
//        let gender = genderTextField.text ?? ""
        
        //check
        if (userId=="")||(password=="")||(cPassword==""){
            Tools.showNotification(title: "", context: "please fill all fields above", VC: self)
            return
        }
        if (password != cPassword){
            Tools.showNotification(title: "", context: "password not match, please try again", VC: self)
            return
        }
//        if (!Tools.isValidEmail(testStr: email)){
//            Tools.showNotification(title: "", context: "invaild email address, please try again", VC: self)
//        }
        
//        let requestModel = RegisterRequestModel(userId: userId, passWd: password, gender: 1, name: name, email: email, age: age!)
//        let requestJson = requestModel.toJsonString()
//        print(requestJson)
        
        //dummy response
//        let responseJson = "{\n\"statusCode\" : 1\n}"
//        let responseModel = try! RegisterResponseModel.decodeFromJsonString(jsonString: responseJson)
//        if(responseModel.statusCode==1){
//            let alert = UIAlertController(title: "", message: "Register success, please log in", preferredStyle: .alert)
//            let ok = UIAlertAction(title: "OK", style: .default){
//                (UIAlertAction) -> Void in
//                self.dismiss(animated: true, completion: nil)
//            }
//            alert.addAction(ok)
//            self.present(alert, animated: true, completion: nil)
//        }else{
//            //show warning page
//            Tools.showNotification(title: "Register Failed", context: "0", VC: self)
//        }
        performSegue(withIdentifier: "SecondRegisterViewControllerSegue", sender: (userId,password))
    }
    

    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
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

extension RegisterViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension RegisterViewController{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "SecondRegisterViewControllerSegue"){
            let vc = segue.destination as! SecondRegisterViewController
            vc.userId = (sender as! (String,String)).0
            vc.password = (sender as! (String,String)).1
            
        }
    }
}

//extension RegisterViewController:UIPickerViewDelegate,UIPickerViewDataSource{
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return genders.count
//    }
//
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return genders[row]
//    }
//
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        genderTextField.text = genders[row]
//        self.genderInt = row
//    }
//}

