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
    static func fetchRepos(_ completionHandeler : @escaping (Result<[Repositorie],Error>) -> Void){
        AF.request(ApiRouter.getRepos).responseData { (response : AFDataResponse<Data>) in
            switch response.result{
            case .success(let repos):
                
                do {
                    let json = try JSONDecoder().decode([Repositorie].self, from: repos)
                    completionHandeler(.success(json))
                    
                } catch {
                    completionHandeler(.failure(error))
                    
                }
                
            case .failure(let err):
                
                completionHandeler(.failure(err))
                
            }
        }
        
    }
}
