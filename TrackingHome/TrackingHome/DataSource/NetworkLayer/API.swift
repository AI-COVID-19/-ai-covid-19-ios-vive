//
//  API.swift
//  TrackingHome
//
//  Created by Mario Acero on 2020-04-02.
//  Copyright © 2020 Mario Acero. All rights reserved.
//

import Foundation

import Foundation
import Alamofire
import Moya

enum API {
    case setUser(token: String)
}

extension API: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://baseUrl.com") else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .setUser:
            return "/setUserExample"
        }
    }
    
    var method: Moya.Method {
        switch  self {
        case .setUser:
            return .post
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .setUser(let token):
            var parameters : [String: String] = [:]
            parameters["authToken"] = token
            let data: Data = try! JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            return .requestData(data)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json",
                "Authorization" : "Bearer 1234" ,
                "platform" : "iOS"
        ]
    }
    
    
}
