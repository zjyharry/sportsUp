//
//  EventDetailResponseModel.swift
//  sportsUp
//
//  Created by Jiayi Zou on 11/25/17.
//  Copyright © 2017 Jiayi Zou. All rights reserved.
//

import Foundation

/// response
//{
//    "event" : {
//        "location" : "nanjinbg",
//        "capacity" : 10,
//        "endTime" : "2017-11-25T10:21:06",
//        "descr" : "hello",
//        "eventId" : 10,
//        "startTime" : "2017-11-25T10:21:06",
//        "users" : [
//        {
//        "userId" : "jiawei"
//        },
//        {
//        "userId" : "TianYou"
//        }
//        ]
//    }
//}
struct EventDetailResponseModel:Codable{
    let isEnrolled:Bool
    let event:EventDetailModel
}
