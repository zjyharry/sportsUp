//
//  CreateStadiumRequestModel.swift
//  sportsUp
//
//  Created by Jiayi Zou on 11/26/17.
//  Copyright © 2017 Jiayi Zou. All rights reserved.
//

import Foundation


/// request:
//{
//    "newStadium" : {
//        "descr" : "hello",
//        "location" : "SU",
//        "capacity" : 10
//    },
//    "userId" : "Jiawei"
//}

struct CreateStadiumRequestModel:Codable {
    let newStadium:StadiumModel
    let userId:String
}
