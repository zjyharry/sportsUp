//
//  CustomedTabBarController.swift
//  sportsUp
//
//  Created by Jiayi Zou on 12/2/17.
//  Copyright © 2017 Jiayi Zou. All rights reserved.
//

import UIKit

class CustomedTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let selectedColor   = UIColor(red: 96/255.0, green: 126/255.0, blue: 183/255.0, alpha: 1.0)
       
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: selectedColor], for: .selected)
        // Do any additional setup after loading the view.
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
