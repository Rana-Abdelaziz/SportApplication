//
//  HomeAPI.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 23/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import Foundation

protocol HomeAPIProtocol {
    func getAllSports(completion: @escaping(Result<SportsResult?, NSError>) -> Void)
}

class HomeAPI: BaseAPI<HomeNetworking>, HomeAPIProtocol {
    
    // MARK: Requests
    
    func getAllSports(completion: @escaping(Result<SportsResult?, NSError>) -> Void){
        self.fetchData(target: .getAllSports, responseClass: SportsResult.self) { (result) in
            completion(result)
        }
    }
    
}
