//
//  HomeNetworking.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 23/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import Foundation

enum HomeNetworking {
    case getAllSports
}

extension HomeNetworking: TargetType {
    
    var baseURL: String {
        switch self {
            
        default: return Constants.BASE_URL
            
        }
    }
    
    var path: String {
        switch self {
        case .getAllSports:
            return Constants.END_POINT_ALL_SPORTS
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getAllSports:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getAllSports:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getAllSports:
            return [:]
        }
    }
    
}
