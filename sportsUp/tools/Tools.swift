//
//  Tools.swift
//  sportsUp
//
//  Created by Jiayi Zou on 11/28/17.
//  Copyright © 2017 Jiayi Zou. All rights reserved.
//

import Foundation
import UIKit
class Tools{
    static func showNotification(title:String?,context:String?,VC:UIViewController){
        let alert = UIAlertController(title: title, message: context, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        VC.present(alert, animated: true, completion: nil)
    }
    
    static func dataToString(data:Data) -> String{
        let result = String(data: data, encoding: .utf8)
        return result ?? ""
    }
    
    static func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    static func getStadium() -> [Int:StadiumModel]{
        var result = [Int:StadiumModel]()
        let stadium1 = StadiumModel(stadiumID: 1, location: "Staples Center", descr: "is a multi-purpose sports arena in Downtown Los Angeles. Adjacent to the L.A. Live development,it is located next to the Los Angeles Convention Center complex along Figueroa Street.The arena opened on October 17, 1999, and is one of the major sporting facilities,in the Greater Los Angeles Area.", long: -118.267254, lat: 34.043017, capacity: 2)
        result[stadium1.stadiumID!] = stadium1
        let stadium2 = StadiumModel(stadiumID: 2, location: "Oracle Arena", descr: "Oracle Arena is an indoor arena located in Oakland, California, United States, and is the home of the Golden State Warriors of the National Basketball Association (NBA). The arena opened in 1966 and is the oldest arena in the NBA. From its opening until 1996 it was known as the Oakland-Alameda County Coliseum Arena.", long: -122.203049, lat: 37.750292, capacity: 2)
        result[stadium2.stadiumID!] = stadium2
        let stadium3 = StadiumModel(stadiumID: 3, location: "Toyota Center", descr: "Toyota Center is an indoor arena located in downtown Houston, Texas. It is named after the Japanese automobile manufacturer Toyota. The arena is home to the Houston Rockets of the National Basketball Association, and the former home of the Houston Aeros of the American Hockey League.", long: -95.3621, lat: 29.750760, capacity: 2)
        result[stadium3.stadiumID!] = stadium3
        let stadium4 = StadiumModel(stadiumID: 4, location: "TD Garden", descr: "TD Garden, often called Boston Garden and \"The Garden\", is a multi-purpose arena in Boston, Massachusetts. It is named after its sponsor, TD Bank, a subsidiary of Canada's Toronto-Dominion Bank. It opened in 1995 as a replacement for the original Boston Garden and has been known as Shawmut Center, FleetCenter, and TD Banknorth Garden. The arena is located directly above the MBTA's North Station.", long: -71.062146, lat: 42.366198, capacity: 2)
        result[stadium4.stadiumID!] = stadium4
        let stadium5 = StadiumModel(stadiumID: 5, location: "Quicken Loans Arena", descr: "Quicken Loans Arena, commonly[citation needed] known as \"The Q\", is a multi-purpose arena in downtown Cleveland, Ohio, United States. The building is the home of the Cleveland Cavaliers of the National Basketball Association (NBA), the Cleveland Monsters of the American Hockey League, and the Cleveland Gladiators of the Arena Football League. It also serves as a secondary arena for Cleveland State Vikings men's and women's basketball.", long: -81.688213, lat: 41.496480, capacity: 2)
        result[stadium5.stadiumID!] = stadium5
        let stadium6 = StadiumModel(stadiumID: 6, location: "Madison Square Garden", descr: "Madison Square Garden, often called \"MSG\" or simply \"The Garden\", is a multi-purpose indoor arena in the New York City borough of Manhattan. Located in Midtown Manhattan between 7th and 8th Avenues from 31st to 33rd Streets, it is situated atop Pennsylvania Station. It is the fourth venue to bear the name \"Madison Square Garden\", the first two (1879 and 1890) were located on Madison Square, on East 26th Street and Madison Avenue, with the third Madison Square Garden (1925) further uptown at Eighth Avenue and 50th Street. The Garden is used for professional basketball and ice hockey, as well as boxing, concerts, ice shows, circuses, professional wrestling and other forms of sports and entertainment. It is close to other midtown Manhattan landmarks, including the Empire State Building, Koreatown, and Macy's at Herald Square. It is home to the New York Rangers of the National Hockey League (NHL), the New York Knicks of the National Basketball Association (NBA), and since 1997, the New York Liberty (WNBA).", long: -73.993439, lat: 40.750504, capacity: 2)
        result[stadium6.stadiumID!] = stadium6
        return result
    }
}
