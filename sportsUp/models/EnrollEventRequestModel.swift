//
//  EnrollEventRequestModel.swift
//  sportsUp
//
//  Created by Jiayi Zou on 11/25/17.
//  Copyright © 2017 Jiayi Zou. All rights reserved.
//

import Foundation


/// Request
//{
//    "eventId" : 1,
//    "userId" : "jiawei"
//}
struct EnrollEventRequestModel:Codable{
    let userId:String
    let eventId:Int
}


