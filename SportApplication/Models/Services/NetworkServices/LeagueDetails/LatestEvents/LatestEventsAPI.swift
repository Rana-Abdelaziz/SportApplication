//
//  LatestEventsAPI.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 23/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import Foundation

protocol LatestEventsAPIProtocol {
    func getLatestEvents(leagueId: String, completion: @escaping(Result<EventsResult?, NSError>) -> Void)
}

class LatestEventsAPI: BaseAPI<LatestEventsNetworking>, LatestEventsAPIProtocol {
    
    // MARK: Requests
    
    func getLatestEvents(leagueId: String, completion: @escaping(Result<EventsResult?, NSError>) -> Void){
        self.fetchData(target: .getLatestEvents(leagueId: leagueId), responseClass: EventsResult.self) { (result) in
            completion(result)
        }
    }
    
}
