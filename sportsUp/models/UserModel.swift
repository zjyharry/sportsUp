//
//  UserModel.swift
//  sportsUp
//
//  Created by Jiayi Zou on 11/25/17.
//  Copyright © 2017 Jiayi Zou. All rights reserved.
//

import Foundation

struct UserModel:Codable{
    let userId:String
    var name:String?
    let gender:Int?
    var age:Int?
    var email:String
    var image:URL?
    
    init(userId:String) {
        self.userId = userId
        self.gender = nil
        self.name = nil
        self.age = nil
        self.image = nil
        self.email = ""
    }
    
    init(userId:String,name:String,gender:Int,age:Int) {
        self.userId = userId
        self.gender = gender
        self.name = name
        self.age = age
        self.image = nil
        self.email = ""
    }
}
