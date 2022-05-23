//
//  UpcomingEventsNetworking.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 23/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import Foundation
import Alamofire

enum UpcomingEventsNetworking {
    case getUpcomingEvents(leagueId: String)
}

extension UpcomingEventsNetworking: TargetType {
    
    var baseURL: String {
        switch self {
            
        default: return Constants.BASE_URL
            
        }
    }
    
    var path: String {
        switch self {
        case .getUpcomingEvents:
            return Constants.END_POINT_EVENTS
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getUpcomingEvents:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getUpcomingEvents(let leagueId):
            return .requestParameters(parameters: ["id": leagueId], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getUpcomingEvents:
            return [:]
        }
    }
    
}
