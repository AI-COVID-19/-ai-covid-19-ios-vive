//
//  AuthResponses.swift
//  TrackingHome
//
//  Created by Mario Acero on 2020-04-05.
//  Copyright © 2020 Mario Acero. All rights reserved.
//

import Foundation
import AWSMobileClient

enum loginStatusResponse {
    case signedOut
    case signedIn
}

typealias loginStatus = (loginStatusResponse) -> Void
typealias SignInResponse = (SignInState) -> Void
