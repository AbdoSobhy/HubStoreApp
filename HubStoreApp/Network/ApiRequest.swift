//
//  ApiRequest.swift
//  HubStoreApp
//
//  Created by Abdelrahman Sobhy on 6/16/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import Foundation
import Alamofire

class ApiRequest {
    static func fetchRepos<T : Codable>(_ completionHandeler : @escaping (T?,Error?) -> Void){
        AF.request(ApiRouter.getRepos).responseData { (response : AFDataResponse<Data>) in
            switch response.result{
            case .success(let repos):
                do {
                    let json = try JSONDecoder().decode(T.self, from: repos)
                    completionHandeler(json,nil)
                    
                } catch {
                    completionHandeler(nil,error)
                }
                
            case .failure(let err):
                completionHandeler(nil,err)
            }
        }
        
    }
}
