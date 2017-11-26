//
//  StadiumModel.swift
//  sportsUp
//
//  Created by Jiayi Zou on 11/26/17.
//  Copyright © 2017 Jiayi Zou. All rights reserved.
//

import Foundation

struct StadiumModel:Codable {
    let stadiumID:Int?
    let location:String
    let descr:String
    let capacity:Int
    init(location:String,descr:String,capacity:Int) {
        self.stadiumID = nil
        self.location = location
        self.descr = descr
        self.capacity = capacity
    }
    init(stadiumId:Int,location:String,descr:String,capacity:Int) {
        self.stadiumID = stadiumId
        self.location = location
        self.descr = descr
        self.capacity = capacity
    }
}
