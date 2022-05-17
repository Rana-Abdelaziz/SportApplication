////
////  EventsNetworkManager.swift
////  SportApplication
////
////  Created by Abdelrhman Ahmed on 17/05/2022.
////  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
////
//
//import Foundation
//import Alamofire
//
//class EventsNetworkManager{
//    
//    var baseUrl = Constants.BASE_URL
//    
//    func getEvents(endPoint: String, completionHandler: @escaping (EventsResult?, Error?) -> ()){
//        
//        print("getEvents called")
//        
//        Alamofire.request(self.baseUrl + endPoint).responseJSON { (response) in
//
//            do {
//                let events = try JSONDecoder().decode(EventsResult.self, from: response.data!)
//                completionHandler(events, nil)
////                print("Sports: \(sports.sports)")
//            } catch {
//                print("error loading data")
//                completionHandler(nil, error)
//            }
//            
//        }
//        
//    }
//    
//}
