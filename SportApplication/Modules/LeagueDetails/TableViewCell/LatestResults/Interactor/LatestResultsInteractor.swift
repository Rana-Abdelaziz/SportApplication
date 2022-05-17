//
//  LatestResultsInteractor.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 17/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import Foundation
import Alamofire

class LatestResultsInteractor {
    
    var baseUrl = ""
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    func getLatestResults(endPoint: String, completionHandler: @escaping (LatestEventsResult?, Error?) -> ()){
        
        print("getLatestResults called")
        
        Alamofire.request(self.baseUrl + endPoint).responseJSON { (response) in

            do {
                let latestResults = try JSONDecoder().decode(LatestEventsResult.self, from: response.data!)
                completionHandler(latestResults, nil)
//                print("Sports: \(sports.sports)")
            } catch {
                print("error loading data")
                completionHandler(nil, error)
            }
            
        }
        
    }
    
}

