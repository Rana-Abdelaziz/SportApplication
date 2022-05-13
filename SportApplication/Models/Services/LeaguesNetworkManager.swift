//
//  LeaguesNetworkManager.swift
//  SportApplication
//
//  Created by Rana on 5/12/22.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import Foundation
import Alamofire

class LeaguesNetworkManager{
    var baseUrl = ""
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    func getLeagues(completionHandler: @escaping (LeaguesResualt?, Error?) -> ()) {
        
        Alamofire.request(self.baseUrl , method: .get).responseJSON { (DataResponse) -> Void in
            do{
                let itemsInJson = DataResponse.data
                               print(DataResponse.result.value!)
                               let result = try JSONDecoder().decode(LeaguesResualt.self,from:itemsInJson!)
                print("resualt is ",result.countries![0].idLeague ?? [])
                completionHandler(result,nil)



            }catch{
                print("error while decoding")
                completionHandler(nil,Error.self as? Error)
            }
                       
            
        }

    }
    
}
