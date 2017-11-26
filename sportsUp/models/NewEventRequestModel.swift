//
//  NewEventRequestModel.swift
//  sportsUp
//
//  Created by Jiayi Zou on 11/25/17.
//  Copyright © 2017 Jiayi Zou. All rights reserved.
//

import Foundation

/// request:
//{
//"newEvent" : {
//    "startTime" : "2017-11-25T09:47:50",
//    "descr" : "123",
//    "endTime" : "2017-11-25T09:47:50",
//    "eventId" : 1,
//    "location" : "Beijing",
//    "capacity" : 15
//    },
//"userId" : "hello"
//}

struct NewEventRequestModel:Codable{
    let userId:String
    let newEvent:EventDetailModel
}
