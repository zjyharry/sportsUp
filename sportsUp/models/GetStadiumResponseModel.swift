//
//  GetStadiumResponseModel.swift
//  sportsUp
//
//  Created by Jiayi Zou on 11/26/17.
//  Copyright © 2017 Jiayi Zou. All rights reserved.
//

import Foundation

struct GetStadiumResponseModel:Codable {
    let count:Int
    let stadiums:[StadiumModel]
    init(count:Int,stadiums:[StadiumModel]) {
        self.count = count
        self.stadiums = stadiums
    }
}
