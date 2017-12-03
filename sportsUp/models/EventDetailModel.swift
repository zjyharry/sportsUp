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
    let location:Int
    let startTime:String
    let endTime:String
    let capacity:Int
    let descr:String
    let classification:String
    var users:[UserModel]?

    init(){
        self.eventId = -1
        self.eventName = ""
        self.location = -1
        self.startTime = ""
        self.endTime = ""
        self.capacity = -1
        self.descr = ""
        self.classification = ""
        self.users = nil
    }
    
    init(eventId: Int, eventName: String, location: Int, startTimeString: String, endTimeString: String, capacity: Int, descr: String, classification: String) {
        self.eventId = eventId
        self.eventName = eventName
        self.location = location
        self.startTime = startTimeString
        self.endTime = endTimeString
        self.capacity = capacity
        self.descr = descr
        self.classification = classification
        self.users = nil
    }
    
    init(eventId:Int,location:Int,descr:String,startTime:Date,endTime:Date,classification:String,capacity:Int,eventName:String){
        self.eventName = eventName
        self.eventId = eventId
        self.capacity = capacity
        self.location = location
        self.descr = descr
        self.classification = classification
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd'T'hh:mm:ss"
        self.startTime = formatter.string(from: startTime)
        self.endTime = formatter.string(from: endTime)
        self.users = nil
    }
    init(eventId:Int,location:Int,descr:String,startTime:Date,endTime:Date,capacity:Int,classification:String,eventName:String,users:[UserModel]){
        self.eventName = eventName
        self.eventId = eventId
        self.capacity = capacity
        self.location = location
        self.descr = descr
        self.classification = classification
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd'T'hh:mm:ss"
        self.startTime = formatter.string(from: startTime)
        self.endTime = formatter.string(from: endTime)
        self.users = users
    }
}
