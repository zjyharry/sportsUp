//
//  ViewController.swift
//  sportsUp
//
//  Created by Jiayi Zou on 11/25/17.
//  Copyright © 2017 Jiayi Zou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let decoder = JSONDecoder()
//        let eventDetail = EventDetailModel(eventId:1,location:"String",descr:"String",startTime:Date(),endTime:Date(),capacity:10,eventName:"hello world",users:[UserModel(userId:"hello"),UserModel(userId:"world")])
//
//        print(eventDetail)
//        let encoder = JSONEncoder()
//        encoder.outputFormatting = .prettyPrinted
//        var data = try! encoder.encode(eventDetail)
//        let jsonStr = String(data:data,encoding:.utf8)!
//        print(jsonStr)
//
//        data = jsonStr.data(using: .utf8)!
//        let decoder = JSONDecoder()
//        let newEventDetail = try! decoder.decode(EventDetailModel.self, from: data)
//        print(newEventDetail)
//        let newCreateStadiumResponseModel = CreateStadiumRequestModel(newStadium: StadiumModel(location:"SU",descr:"hello",capacity:10) , userId: "Jiawei")
//        var data = try! encoder.encode(newCreateStadiumResponseModel)
//        let jsonStr = String(data:data,encoding:.utf8)!
//        print(jsonStr)
        let newGetStadiumResponseModel = GetStadiumResponseModel(count: 2,stadiums:[StadiumModel(stadiumId:1,location:"SU",descr:"hello",capacity:10),StadiumModel(stadiumId:2,location:"SU",descr:"world",capacity:10)])
        let data = try! encoder.encode(newGetStadiumResponseModel)
        let jsonStr = String(data: data, encoding: .utf8)!
        print(jsonStr)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

