//
//  EventDetailModel.swift
//  sportsUp
//
//  Created by Jiayi Zou on 11/25/17.
//  Copyright © 2017 Jiayi Zou. All rights reserved.
//

import Foundation


///  model:
//{
//    "startTime" : "2017-11-25T09:47:50",
//    "descr" : "123",
//    "endTime" : "2017-11-25T09:47:50",
//    "eventId" : 1,
//    "location" : "Beijing",
//    "capacity" : 15
//}

struct EventDetailModel:Codable{
    let eventId:Int
    let eventName:String
    let location:String
    let startTime:String
    let endTime:String
    let capacity:Int
    let descr:String
    let users:[UserModel]?
    init(eventId:Int,location:String,descr:String,startTime:Date,endTime:Date,capacity:Int,eventName:String){
        self.eventName = eventName
        self.eventId = eventId
        self.capacity = capacity
        self.location = location
        self.descr = descr
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd'T'hh:mm:ss"
        self.startTime = formatter.string(from: startTime)
        self.endTime = formatter.string(from: endTime)
        self.users = nil
    }
    init(eventId:Int,location:String,descr:String,startTime:Date,endTime:Date,capacity:Int,eventName:String,users:[UserModel]){
        self.eventName = eventName
        self.eventId = eventId
        self.capacity = capacity
        self.location = location
        self.descr = descr
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd'T'hh:mm:ss"
        self.startTime = formatter.string(from: startTime)
        self.endTime = formatter.string(from: endTime)
        self.users = users
    }
}
