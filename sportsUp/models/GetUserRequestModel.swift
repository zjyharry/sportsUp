//
//  GetUserRequestModel.swift
//  sportsUp
//
//  Created by Jiayi Zou on 12/2/17.
//  Copyright © 2017 Jiayi Zou. All rights reserved.
//

import Foundation

struct GetUserRequestModel:Codable {
    let userId:String

    init(userId: String) {
        self.userId = userId
    }
}
