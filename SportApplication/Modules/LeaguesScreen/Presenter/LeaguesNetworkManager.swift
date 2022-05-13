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
    
    //endPoint: String,
    func getLeagues(completionHandler: @escaping (String?, Error?) -> ()) {
        
        Alamofire.request(self.baseUrl , method: .get,encoding: URLEncoding.default).responseJSON { (DataResponse)->Void in
            //print("Data",DataResponse.data)
          
            
            do{
//                let itemsInJson = try     JSONSerialization.data(withJSONObject:DataResponse.data!)
                //let itemsInJson = try JSONSerialization.data(withJSONObject:DataResponse.result.value!)
                let itemsInJson = DataResponse.data 
                print(DataResponse.result.value!)
                let result = try JSONDecoder().decode([LeaguesModel].self,from:itemsInJson!)
                print(result[0].idLeague ?? "nothing" )
            }catch{
                print("error while decoding")
            }
            
            
        }
//        print(r)
//        guard let jsn = r.response else{
//            print("error")
//            completionHandler(nil,"Error" as? Error)
//            return
//        }
//        completionHandler("okii",nil)
//        print(jsn)
        
            //.responseDecodable(of: [LeaguesModel].self)
//        { (response) in
//            print("result: \(response)")
//
//            let result = response.result
//            switch result {
//            case .success(let todos):
//                print("Result SUCCESS")
//                completionHandler(todos, nil)
//            case .failure(let error):
//                print("Result FAILED")
//                completionHandler(nil, error)
//            }
//
//        }
    }
    
}
