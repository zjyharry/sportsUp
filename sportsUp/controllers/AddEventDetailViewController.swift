//
//  AddEventDetailViewController.swift
//  sportsUp
//
//  Created by Jiayi Zou on 12/1/17.
//  Copyright © 2017 Jiayi Zou. All rights reserved.
//

import UIKit

class AddEventDetailViewController: UIViewController {
    var categray = "1"
    var value = ""
    let locationList = Array(Tools.getStadium().values)
    
    @IBOutlet weak var catagrayLabel: UILabel!
    
    @IBOutlet weak var valueLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        picker.selectRow(0, inComponent: 0, animated: false)
        
        let datePicker = UIDatePicker()
        datePicker.date = Date()
        datePicker.datePickerMode = .dateAndTime
        
        self.valueLabel.backgroundColor = UIColor.white
        if(categray == "Location"){
            valueLabel.inputView = picker
        }else if(categray == "Start Time")||(categray == "End Time"){
            valueLabel.inputView = datePicker
            datePicker.addTarget(self, action: #selector(datePickerValueChanged(sender:)), for: .valueChanged)
        }
        // Do any additional setup after loading the view.
    }
    
    @objc func datePickerValueChanged(sender:UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd'T'hh:mm:ss"
        valueLabel.text = dateFormatter.string(from: sender.date).replacingOccurrences(of: "T", with: " ")
        
        let vc = self.navigationController?.viewControllers[1] as! AddEventTableViewController!
        vc?.value[categray] = valueLabel.text
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        //catagrayLabel.text = categray
        self.title = categray
        valueLabel.delegate = self
        self.view.backgroundColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 242/255.0, alpha: 1.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension AddEventDetailViewController:UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        value = textField.text!
        let vc = self.navigationController?.viewControllers[1] as! AddEventTableViewController!
        vc?.value[categray] = value + string

        //print(vc.isKind(of: AddEventTableViewController.self)==true)
        
        //nvc.value[categray] = value
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}

extension AddEventDetailViewController:UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return locationList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return locationList[row].location
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        valueLabel.text = locationList[row].location
        value = valueLabel.text!
        let vc = self.navigationController?.viewControllers[1] as! AddEventTableViewController!
        vc?.value[categray] = value
        vc?.value["locationInt"] = "\((locationList[row].stadiumID)!)"
    }
    
    
}

