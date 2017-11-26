//
//  CreateStadiumRequestModel.swift
//  sportsUp
//
//  Created by Jiayi Zou on 11/26/17.
//  Copyright © 2017 Jiayi Zou. All rights reserved.
//

import Foundation

struct CreateStadiumRequestModel:Codable {
    let newStadium:StadiumModel
    let userId:String
}
