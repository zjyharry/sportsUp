//
//  EventListResponseModel.swift
//  sportsUp
//
//  Created by Jiayi Zou on 11/25/17.
//  Copyright © 2017 Jiayi Zou. All rights reserved.
//

import Foundation


/// response:
//{
//    "count" : 2,
//    "eventList" : [
//    {
//    "startTime" : "2017-11-25T09:34:49.49",
//    "endTime" : "2017-11-25T09:34:49.49",
//    "eventId" : 1,
//    "location" : "beijing",
//    "capacity" : 10
//    },
//    {
//    "startTime" : "2017-11-25T09:34:49.49",
//    "endTime" : "2017-11-25T09:34:49.49",
//    "eventId" : 2,
//    "location" : "Nanjing",
//    "capacity" : 15
//    }
//    ]
//}

struct EventListResponseModel:Codable{
    let count:Int
    let eventList:[EventDetailModel]
}
