//
//  EventDetailViewController.swift
//  sportsUp
//
//  Created by Jiayi Zou on 12/1/17.
//  Copyright © 2017 Jiayi Zou. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController {
    var model = EventDetailModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
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

