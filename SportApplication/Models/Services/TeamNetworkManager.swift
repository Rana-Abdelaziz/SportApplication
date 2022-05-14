//
//  TeamNetworkManager.swift
//  SportApplication
//
//  Created by Rana on 5/14/22.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import Foundation
import Alamofire

class TeamNetworkManager{
    
    //https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l=English%20Premier%20League
    
    var baseUrl = ""
       
       init(baseUrl: String) {
           self.baseUrl = baseUrl
       }
       
    func getTeamDetailes(myParameters:String,completionHandler: @escaping (TeamsResualt?, Error?) -> ()) {
           
        Alamofire.request(self.baseUrl ,method: .get, parameters: ["":myParameters] ).responseJSON { (DataResponse) -> Void in
               do{
                   let itemsInJson = DataResponse.data
                                  //print(DataResponse.result.value!)
                                  let result = try JSONDecoder().decode(TeamsResualt.self,from:itemsInJson!)
                  // print("resualt is ",result.countries![0].idLeague ?? [])
                   completionHandler(result,nil)



               }catch{
                   print("error while decoding")
                   completionHandler(nil,Error.self as? Error)
               }
                          
               
           }

       }
       
    
}
