//
//  ApiRouter.swift
//  HubStoreApp
//
//  Created by Abdelrahman Sobhy on 6/16/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import Foundation
import Alamofire

enum ApiRouter : URLRequestConvertible {
    
    enum constent {
        // AbdoSobhy
        static var userName = "AbdoSobhy"
    }
    case getRepos
    
    var url : URL {
        switch self {
        case .getRepos:
            return URL(string: "https://api.github.com/users/\(constent.userName)/repos")!
        }
    }
    var method : HTTPMethod {
        switch self {
        case .getRepos :
            return .get

        }
    }
    var parameters : [String:Any] {
        switch self {

        default:
            return [:]
        }
    }
    
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.method = method
        
        return try URLEncoding.default.encode(urlRequest, with: parameters)
    }
}
