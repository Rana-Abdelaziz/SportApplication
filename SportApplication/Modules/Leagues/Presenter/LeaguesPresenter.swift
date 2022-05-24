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
    let leaguesApi: LeaguesAPIProtocol = LeaguesAPI()
//    private var leagues = [LeaguesModel]()
    
//    func getLeagues(sportName: String){
////        view?.showIndicator()
//        leaguesApi.getLeagues(sportName: sportName) { [weak self] (result) in
//            switch result {
//            case .success(let leagues):
////                self?.leagues = leagues?.countries ?? []
////                self?.view?.hideIndicator()
////                self?.view?.fetchingDataSuccess()
//                self?.leaguesView.reloadTable(myLeagues: leagues?.countries ?? [])
//
//
//            case .failure(let error): break
//                // Show UI Error
////                self?.view?.hideIndicator()
////                self?.view?.showError(errorMsg: error.userInfo[NSLocalizedDescriptionKey] as? String ?? "Unknown Error")
//            }
//
//        }
//    }
    
    func getLeagues(parameters: String,url:String) {
        let network = LeaguesNetworkManager(baseUrl: url)
                network.getLeagues(param: parameters,completionHandler: {[weak self] leagues, error in
                    guard let self = self else{return}
                    
                 if let myError = error {
                     print(error)
//                    self.leaguesView.DispalyData(myLeagues: nil,error:myError)
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
//    func getLeagues(sportName: String)
   // func getLeagues(parameters:String,url:String,completionHandler: @escaping (LeaguesResualt?, Error?) -> ())
}
