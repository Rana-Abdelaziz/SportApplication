//
//  BaseAPI.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 23/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import Foundation
import Alamofire

class BaseAPI<T: TargetType> {

    func fetchData<M: Decodable>(target: T, responseClass: M.Type, completion: @escaping (Swift.Result<M?, NSError>) -> Void){
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let headers = target.headers

        let params = buildParams(task: target.task)
        
        Alamofire.request(target.baseURL + target.path, method: .get, parameters: params.0, encoding: params.1, headers: headers).responseJSON { (response) in

            guard let statusCode = response.response?.statusCode else {
                // Add custom error
                print("Can't get status code")
                let error = NSError(domain: target.baseURL, code: 0, userInfo: [NSLocalizedDescriptionKey: ErrorMessages.DEFAULT_ERROR_MESSAGE])
                completion(.failure(error))
                return
            }
            
            if statusCode == 200 {
                // successful request
                guard let jsonResponse = try? response.data else {
                    // Add custom error
                    print("Error while getting response")
                    let error = NSError(domain: target.baseURL, code: 0, userInfo: [NSLocalizedDescriptionKey: ErrorMessages.DEFAULT_ERROR_MESSAGE])
                    completion(.failure(error))
                    return
                }
                
                guard let responseObject = try? JSONDecoder().decode(M.self, from: jsonResponse) else{
                    print("Error while decoding")
                    let error = NSError(domain: target.baseURL, code: 0, userInfo: [NSLocalizedDescriptionKey: ErrorMessages.DEFAULT_ERROR_MESSAGE])
                   completion(.failure(error))
                   return
                }
                
                // return the result
                print("\(responseClass) result returned successfully")
                completion(.success(responseObject))
                
            } else {
                // Add custom error based on status code
                print("Status code not successful 200")
                let error = NSError(domain: target.baseURL, code: statusCode, userInfo: [NSLocalizedDescriptionKey: ErrorMessages.DEFAULT_ERROR_MESSAGE])
                completion(.failure(error))
            
            }
            
        }

    }
    
    private func buildParams(task: Task) -> ([String: Any], ParameterEncoding){
        switch task {
            
        case .requestPlain:
            return ([:], URLEncoding.default)
        case .requestParameters(parameters: let parameters, encoding: let encoding):
            return (parameters, encoding)
        }
    }
    
}
