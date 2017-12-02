//
//  LoginResponseModel.swift
//  sportsUp
//
//  Created by Jiayi Zou on 11/25/17.
//  Copyright © 2017 Jiayi Zou. All rights reserved.
//

import Foundation


/// response:
//{
//    "statusCode" : 1
//}

struct LoginResponseModel:Codable {
    let statusCode:Int
}

extension Decodable{
    static func decodeFromJsonString(jsonString:String) throws -> Self{
        let data = jsonString.data(using: .utf8)
        let decoder = JSONDecoder()
        return try decoder.decode(Self.self , from:data!)
    }
    
    static func decodeFromJsonData(data:Data) throws ->Self{
        let decoder = JSONDecoder()
        return try decoder.decode(Self.self, from: data)
    }
}
