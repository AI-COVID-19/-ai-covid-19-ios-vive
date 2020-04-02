//
//  NetworkProvider.swift
//  TrackingHome
//
//  Created by Mario Acero on 2020-04-02.
//  Copyright © 2020 Mario Acero. All rights reserved.
//

import Foundation
import Moya

typealias JobsCustomClosure = (API) -> Endpoint

class NetworkProvider: Network {
    var provider: MoyaProvider<API>
    
    required init(customClosure: JobsCustomClosure? = nil) {
        if customClosure == nil {
            provider = MoyaProvider<API> (plugins: [NetworkLoggerPlugin()])
            return
        }
        provider = MoyaProvider<API>(endpointClosure: customClosure!, stubClosure: MoyaProvider.immediatelyStub)
    }
    
    func setUser(token: String, completion: @escaping (ApiServiceResponse) -> Void){
        provider.request(API.setUser(token: token)) { (result) in
            switch result {
            case .success(let response):
                completion(.success(response: response))
            case .failure(let errorResponse):
                completion(.failure(error:errorResponse.errorDescription))
            }
        }
    }
}
