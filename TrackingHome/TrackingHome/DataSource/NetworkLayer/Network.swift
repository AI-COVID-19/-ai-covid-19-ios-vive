//
//  Network.swift
//  TrackingHome
//
//  Created by Mario Acero on 2020-04-02.
//  Copyright © 2020 Mario Acero. All rights reserved.
//

import Foundation
import Moya

protocol Network {
    associatedtype T: TargetType
    var provider: MoyaProvider<T> { get }
}

enum ApiServiceResponse {
    case failure(error: Any?)
    case notConnectedToInternet
    case success(response: Response?)
}
