//
//  TeamsPresenter.swift
//  SportApplication
//
//  Created by Rana on 5/14/22.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import Foundation
class TeamPresenter : TeamsPresnterProtocol{
  
    func getTeams(url:String,completionHandler: @escaping (TeamsResualt?, Error?) -> ()){
        let network = TeamNetworkManager(baseUrl: url)
        network.getTeamDetailes { (TeamsResualt , Error) in
            guard let result = TeamsResualt else{
                completionHandler(nil,Error)
                return
            }
            completionHandler(result,nil)
            
        }
    }
    
    
}
protocol TeamsPresnterProtocol {
    func getTeams(url:String,completionHandler: @escaping (TeamsResualt?, Error?) -> ())
}
