//
//  HomeInteractor.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 13/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import Foundation
import Alamofire

class HomeInteractor {
    
    var baseUrl = ""
        
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    func getSports(endPoint: String, completionHandler: @escaping (SportsResult?, Error?) -> ()){
        
        print("getSports called")
        
        Alamofire.request(self.baseUrl + endPoint).responseJSON { (response) in

            do {
                let sports = try JSONDecoder().decode(SportsResult.self, from: response.data!)
                completionHandler(sports, nil)
//                print("Sports: \(sports.sports)")
            } catch {
                print("error loading data")
                completionHandler(nil, error)
            }
            
        }
        
    }
    
}
