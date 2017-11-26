//
//  EventDetailRequestModel.swift
//  sportsUp
//
//  Created by Jiayi Zou on 11/25/17.
//  Copyright © 2017 Jiayi Zou. All rights reserved.
//

import Foundation



/// request

//{
//    "eventId" : 12,
//    "userId" : "Jiawei"
//}

struct EventDetailRequestModel:Codable{
    let userId:String
    let eventId:Int
}
