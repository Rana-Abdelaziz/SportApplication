//
//  UpcomingEventsAPI.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 23/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import Foundation

protocol UpcomingEventsAPIProtocol {
    func getUpcomingEvents(leagueId: String, completion: @escaping(Result<EventsResult?, NSError>) -> Void)
}

class UpcomingEventsAPI: BaseAPI<UpcomingEventsNetworking>, UpcomingEventsAPIProtocol {
    
    // MARK: Requests
    
    func getUpcomingEvents(leagueId: String, completion: @escaping(Result<EventsResult?, NSError>) -> Void){
        self.fetchData(target: .getUpcomingEvents(leagueId: leagueId), responseClass: EventsResult.self) { (result) in
            completion(result)
        }
    }
    
}
