//
//  Tools.swift
//  sportsUp
//
//  Created by Jiayi Zou on 11/28/17.
//  Copyright © 2017 Jiayi Zou. All rights reserved.
//

import Foundation
import UIKit
class Tools{
    static func showNotification(title:String?,context:String?,VC:UIViewController){
        let alert = UIAlertController(title: title, message: context, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        VC.present(alert, animated: true, completion: nil)
    }
    
    static func dataToString(data:Data) -> String{
        let result = String(data: data, encoding: .utf8)
        return result ?? ""
    }
    
    static func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
}
