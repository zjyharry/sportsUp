//
//  LoginRequestModel.swift
//  sportsUp
//
//  Created by Jiayi Zou on 11/25/17.
//  Copyright © 2017 Jiayi Zou. All rights reserved.
//

import Foundation


/// request:
//{
//    "userId" : "tian",
//    "passWd" : "God"
//}

struct LoginRequestModel:Codable {
    let userId:String
    let password:String
    init(userId:String,passWd:String) {
        self.userId = userId
        self.password = passWd
    }
}

extension Encodable{
    func toJsonString() -> String{
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let result = try! encoder.encode(self)
        let resultString = String(data: result, encoding: .utf8)
        return resultString ?? ""
    }
    
    func toJsonData() -> Data{
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let result = try! encoder.encode(self)
        return result
    }
}
