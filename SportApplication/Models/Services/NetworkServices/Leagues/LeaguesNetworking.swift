//
//  LeaguesNetworking.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 24/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import Foundation
import Alamofire

enum LeaguesNetworking {
    case getLeagues(sportName: String)
}

extension LeaguesNetworking: TargetType {
    
    var baseURL: String {
        switch self {
            
        default: return Constants.BASE_URL
            
        }
    }
    
    var path: String {
        switch self {
        case .getLeagues:
            return Constants.END_POINT_LEAGUES
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getLeagues:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getLeagues(let sportName):
            return .requestParameters(parameters: ["s": sportName], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getLeagues:
            return [:]
        }
    }
    
}

