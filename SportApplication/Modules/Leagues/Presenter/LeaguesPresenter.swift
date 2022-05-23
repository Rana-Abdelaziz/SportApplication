//
//  LeaguesPresenter.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 14/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import Foundation

class LeaguesPresenter : LeaguesProtocol{
    
    let leaguesView: LeaguesTableViewProtocol = LeaguesViewController()
    func getLeagues(parameters: String,url:String) {
        let network = LeaguesNetworkManager(baseUrl: url)
                network.getLeagues(param: parameters,completionHandler: {[weak self] leagues, error in
                    guard let self = self else{return}
                    
                 if let myError = error {
                     print(error)
                    self.leaguesView.DispalyData(myLeagues: nil,error:myError)
                 } else {
                     guard let resualt = leagues else { return }
                    self.leaguesView.DispalyData(myLeagues: resualt,error:nil)
                 }
             })
        
    }
    
    func getLeaguess(parameters:String,url:String,completionHandler: @escaping (LeaguesResualt?, Error?) -> ()){
        let network = LeaguesNetworkManager(baseUrl: url)
        network.getLeagues(param: parameters,completionHandler: { leagues, error in

         if let error = error {
             print(error)
            completionHandler(nil,Error.self as? Error)
         } else {
             guard let resualt = leagues else { return }
            completionHandler(resualt,nil)
         }
     })

    }
}
protocol LeaguesProtocol {
    func getLeagues(parameters: String,url:String)
   // func getLeagues(parameters:String,url:String,completionHandler: @escaping (LeaguesResualt?, Error?) -> ())
}
