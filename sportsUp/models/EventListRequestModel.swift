//
//  EventListRequestModel.swift
//  sportsUp
//
//  Created by Jiayi Zou on 11/25/17.
//  Copyright © 2017 Jiayi Zou. All rights reserved.
//

import Foundation


/// request:
//{
//    "count" : 10,
//    "userId" : "hello"
//}

struct EventListRequestModel:Codable{
    let count:Int
    let userId:String
}
