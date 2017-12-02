//
//  RegisterRequestModel.swift
//  sportsUp
//
//  Created by Jiayi Zou on 11/25/17.
//  Copyright © 2017 Jiayi Zou. All rights reserved.
//

import Foundation

///Request:
//{
//"gender" : 0,
//"passWd" : "134",
//"email" : "jzou04@syr.edu",
//"userId" : "hello",
//"age" : 2,
//"name" : "jiayi"
//}

struct RegisterRequestModel:Codable{
    let userId:String
    let password:String
    let gender:Int
    let name:String
    let email:String
    let age:Int
}
