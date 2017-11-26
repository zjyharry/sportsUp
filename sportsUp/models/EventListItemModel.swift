//
//  EventListItemModel.swift
//  sportsUp
//
//  Created by Jiayi Zou on 11/25/17.
//  Copyright © 2017 Jiayi Zou. All rights reserved.
//

import Foundation


/// item:
//{
//    "startTime" : "2017-11-25T09:34:49",
//    "endTime" : "2017-11-25T09:34:49",
//    "eventId" : 1,
//    "location" : "beijing",
//    "capacity" : 10
//}

struct EventListItemModel:Codable{
    let eventId:Int
    let location:String
    let startTime:String
    let endTime:String
    let capacity:Int
    
    init(eventId:Int,location:String,startTime:Date,endTime:Date,capacity:Int) {
        self.eventId = eventId
        self.capacity = capacity
        self.location = location
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd'T'hh:mm:ss"
        self.startTime = formatter.string(from: startTime)
        self.endTime = formatter.string(from: endTime)
    }
}
