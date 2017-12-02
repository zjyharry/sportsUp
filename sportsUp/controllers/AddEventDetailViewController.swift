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
    let locationList = [StadiumModel]()
    
    @IBOutlet weak var catagrayLabel: UILabel!
    
    @IBOutlet weak var valueLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        
        let datePicker = UIDatePicker()
        datePicker.date = Date()
        datePicker.datePickerMode = .dateAndTime
        
        if(categray == ""){
            valueLabel.inputView = picker
        }else if(categray == "1"){
            valueLabel.inputView = datePicker
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        catagrayLabel.text = categray
        valueLabel.delegate = self
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
        vc?.value[categray] = value

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
    
    
}

