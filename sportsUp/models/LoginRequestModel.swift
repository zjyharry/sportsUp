//
//  LoginRequestModel.swift
//  sportsUp
//
//  Created by Jiayi Zou on 11/25/17.
//  Copyright © 2017 Jiayi Zou. All rights reserved.
//

import Foundation


/// request:
//{
//    "userId" : "tian",
//    "passWd" : "God"
//}

struct LoginRequestModel:Codable {
    let userId:String
    let passWd:String
}
