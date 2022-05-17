//
//  TeamsInteractor.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 17/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import Foundation
import Alamofire

class TeamsInteractor {
    
    var baseUrl = ""
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    func getTeamsResult(endPoint: String, completionHandler: @escaping (TeamsResualt?, Error?) -> ()){
        
        print("getTeamsResult called")
        
        Alamofire.request(self.baseUrl + endPoint).responseJSON { (response) in

            do {
                let teamsResult = try JSONDecoder().decode(TeamsResualt.self, from: response.data!)
                completionHandler(teamsResult, nil)
            } catch {
                print("error loading data")
                completionHandler(nil, error)
            }
            
        }
        
    }
    
}
