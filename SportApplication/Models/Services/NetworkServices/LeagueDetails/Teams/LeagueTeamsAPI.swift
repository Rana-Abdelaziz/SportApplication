//
//  LeagueTeamsAPI.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 23/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import Foundation

protocol LeagueTeamsAPIProtocol {
    func getLeagueTeams(leagueName: String, completion: @escaping(Result<TeamsResualt?, NSError>) -> Void)
}
 
class LeagueTeamsAPI: BaseAPI<LeagueTeamsNetworking>, LeagueTeamsAPIProtocol {
    
    // MARK: Requests
    
    func getLeagueTeams(leagueName: String, completion: @escaping(Result<TeamsResualt?, NSError>) -> Void){
        self.fetchData(target: .getLeagueTeams(leagueName: leagueName), responseClass: TeamsResualt.self) { (result) in
            completion(result)
        }
    }
    
}
