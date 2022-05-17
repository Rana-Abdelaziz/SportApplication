//
//  UpcomingEventsInteractor.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 17/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import Foundation
import Alamofire

class UpcomingEventsInteractor {
    
    var baseUrl = ""
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    func getUpcomingEvents(endPoint: String, completionHandler: @escaping (UpcomingEventsResult?, Error?) -> ()){
        
        print("getUpcomingEvents called")
        
        Alamofire.request(self.baseUrl + endPoint).responseJSON { (response) in

            do {
                let upcomingEvents = try JSONDecoder().decode(UpcomingEventsResult.self, from: response.data!)
                completionHandler(upcomingEvents, nil)
//                print("Sports: \(sports.sports)")
            } catch {
                print("error loading data")
                completionHandler(nil, error)
            }
            
        }
        
    }
    
}

