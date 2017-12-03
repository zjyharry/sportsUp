//
//  StadiumModel.swift
//  sportsUp
//
//  Created by Jiayi Zou on 11/26/17.
//  Copyright © 2017 Jiayi Zou. All rights reserved.
//

import Foundation

struct StadiumModel:Codable {
    var stadiumID:Int?
    var location:String
    var descr:String
    var long:Double
    var lat:Double
    var capacity:Int

    init(stadiumID: Int?, location: String, descr: String, long: Double, lat: Double, capacity: Int) {
        self.stadiumID = stadiumID
        self.location = location
        self.descr = descr
        self.long = long
        self.lat = lat
        self.capacity = capacity
    }
    
    init(location:String,descr:String,capacity:Int) {
        self.stadiumID = nil
        self.location = location
        self.lat = 0.0
        self.long = 0.0
        self.descr = descr
        self.capacity = capacity
    }
    init(stadiumId:Int,location:String,descr:String,capacity:Int) {
        self.lat = 0.0
        self.long = 0.0
        self.stadiumID = stadiumId
        self.location = location
        self.descr = descr
        self.capacity = capacity
    }
}
