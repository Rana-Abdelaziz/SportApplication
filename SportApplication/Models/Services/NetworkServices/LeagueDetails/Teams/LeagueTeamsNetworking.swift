//
//  LeagueTeamsNetworking.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 23/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import Foundation
import Alamofire

enum LeagueTeamsNetworking {
    case getLeagueTeams(leagueName: String)
}

extension LeagueTeamsNetworking: TargetType {
    
    var baseURL: String {
        switch self {
            
        default: return Constants.BASE_URL
            
        }
    }
    
    var path: String {
        switch self {
        case .getLeagueTeams:
            return Constants.END_POINT_TEAMS
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getLeagueTeams:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getLeagueTeams(let leagueName):
            return .requestParameters(parameters: ["l": leagueName], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getLeagueTeams:
            return [:]
        }
    }
    
}
