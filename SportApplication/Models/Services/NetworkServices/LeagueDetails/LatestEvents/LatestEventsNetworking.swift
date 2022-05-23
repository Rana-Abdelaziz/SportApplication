//
//  LatestEventsNetworking.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 23/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import Foundation
import Alamofire

enum LatestEventsNetworking {
    case getLatestEvents(leagueId: String)
}

extension LatestEventsNetworking: TargetType {
    
    var baseURL: String {
        switch self {
            
        default: return Constants.BASE_URL
            
        }
    }
    
    var path: String {
        switch self {
        case .getLatestEvents:
            return Constants.END_POINT_EVENTS
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getLatestEvents:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getLatestEvents(let leagueId):
            return .requestParameters(parameters: ["id": leagueId], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getLatestEvents:
            return [:]
        }
    }
    
}
