//
//  LeaguesAPI.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 24/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import Foundation

protocol LeaguesAPIProtocol {
    func getLeagues(sportName: String, completion: @escaping(Result<LeaguesResualt?, NSError>) -> Void)
}
 
class LeaguesAPI: BaseAPI<LeaguesNetworking>, LeaguesAPIProtocol {
    
    // MARK: Requests
    
    func getLeagues(sportName: String, completion: @escaping(Result<LeaguesResualt?, NSError>) -> Void){
        self.fetchData(target: .getLeagues(sportName: sportName), responseClass: LeaguesResualt.self) { (result) in
            completion(result)
        }
    }
    
}
