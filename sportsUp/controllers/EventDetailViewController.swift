//
//  EventDetailViewController.swift
//  sportsUp
//
//  Created by Jiayi Zou on 12/1/17.
//  Copyright © 2017 Jiayi Zou. All rights reserved.
//

import UIKit
import MapKit
import MessageUI
class EventDetailViewController: UIViewController {
    var model = EventDetailModel()
    var locationList = Tools.getStadium()
    let imageDic:[String:UIImage]=["basketball":#imageLiteral(resourceName: "basketBallImage"),"soccer":#imageLiteral(resourceName: "12副本"),"football":#imageLiteral(resourceName: "footballImage")]
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        getUpdatedEventDetail()
        // Do any additional setup after loading the view.
        self.titleLabel.text = model.eventName
        self.locationLabel.text = locationList[model.location]?.location
        self.startTimeLabel.text = model.startTime.replacingOccurrences(of: "T", with: " ")
        self.endTimeLabel.text = model.endTime.replacingOccurrences(of: "T", with: " ")
        self.descriptionLabel.text = model.descr
        self.imageView.image = imageDic[model.classification]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    func getUpdatedEventDetail(){
        let requestModel = EventDetailRequestModel(userId: UserDefaults.standard.string(forKey: "UserId")!, eventId: model.eventId)
        let requestJsonData = requestModel.toJsonData()
        let urlString = "http://\(UserDefaults.standard.string(forKey: "IPADDRESS")!):8080/eventdetail"
        let url = URL(string:urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = requestJsonData
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        #if(DEBUGG)
            print(requestModel.toJsonString())
        #endif
        request.timeoutInterval = 10
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request,
                                        completionHandler: {
                                            (data, response, serror) -> Void in
                                            if serror != nil{
                                                print(serror?.localizedDescription)
                                                Tools.showNotification(title: "Request failed", context: "Please try again later", VC: self)
                                            }
                                            else
                                            {
                                                print(String(data: data!, encoding: .utf8) )
                                                let responseModel = try! EventDetailResponseModel.decodeFromJsonData(data:data!)
                                                print(responseModel.toJsonString())
                                                self.model.users = responseModel.users
                                                DispatchQueue.main.async {
                                                    self.setNeedsFocusUpdate()
                                                }
                                            }
                                            
        })
        dataTask.resume()
    }
    
    @IBAction func interestedButtonPressed(_ sender: Any) {
    
    }
    
    
    @IBAction func shareButtonPressed(_ sender: Any) {
        let controller = MFMessageComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setSubject("\(UserDefaults.standard.string(forKey: "UserId")!) invite you to join \(model.eventName)")
            mail.setMessageBody("Hi my friend:\nThis is an invitation from \(UserDefaults.standard.string(forKey: "UserId")!),\nevent:\(model.toJsonString().replacingOccurrences(of: "{", with: "").replacingOccurrences(of: "}", with: ""))\n\n Hope to see you there!", isHTML: false)
            self.present(mail, animated: true, completion: nil)
        } else {
            
        }
        
    }
    
    @IBAction func attendButtonPressed(_ sender: Any) {
        let userId = UserDefaults.standard.string(forKey: "UserId")!
        let requestModel = EnrollEventRequestModel(userId: userId, eventId: model.eventId)
        let urlString = "http://\(UserDefaults.standard.string(forKey: "IPADDRESS")!):8080/event_join"
        let url = URL(string:urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = requestModel.toJsonData()
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request,
                                        completionHandler: {
                                            (data, response, serror) -> Void in
                                            if serror != nil{
                                                print(serror?.localizedDescription)
                                            }
                                            do{
                                                var responseModel = try? EnrollEventResponseModel.decodeFromJsonData(data:data ?? Data())
                                                #if(DEBUG)
                                                    responseModel = EnrollEventResponseModel(statusCode: 1)
                                                #endif
                                                DispatchQueue.main.async {
                                                    var vc:UIResponder = self
                                                    if responseModel?.statusCode == 1 {
                                                        Tools.showNotification(title: "", context: "Enroll success.", VC: self)
                                                    }else{
                                                        Tools.showNotification(title: "", context: "Enroll failed, please try again later.", VC: self)
                                                    }
                                                }
                                            }
                                            
        })
        dataTask.resume()
    }
    
    
    @IBAction func mapButtonPressed(_ sender: Any) {
        let coordinate = CLLocationCoordinate2DMake((locationList[model.location]?.lat)!, (locationList[model.location]?.long)!)
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary:nil))
        mapItem.name = locationList[model.location]?.location
        mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving])
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="UsersInEventTableViewSegue"){
            let vc = segue.destination as! UsersInEventTableViewController
            vc.users = self.model.users
        }
    }
    
}

extension EventDetailViewController:MFMailComposeViewControllerDelegate{
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
