//
//  AuthMananger.swift
//  TrackingHome
//
//  Created by Mario Acero on 2020-04-05.
//  Copyright © 2020 Mario Acero. All rights reserved.
//

import Foundation
import AWSMobileClient

class AuthMananger {
    
    func validateUserLoginState(completion: @escaping loginStatus) {
        AWSMobileClient.default().initialize { (userState, error) in
            if error != nil {
                completion(.signedOut)
                return
            }
            guard let userState = userState else {
                completion(.signedOut)
                return
            }
            
            switch userState {
            case .signedOutUserPoolsTokenInvalid:
                AWSMobileClient.default().signIn(username:  "username",
                                                 password: "password",
                                                 completionHandler: { (state, err) in
                    
                     if err != nil {
                        completion(.signedOut)
                         return
                     }
                                                    
                     guard let state = state else {
                         completion(.signedOut)
                         return
                     }
                     
                    switch state.signInState {
                    case .signedIn:
                        completion(.signedIn)
                    default:
                        completion(.signedOut)
                    }
                });
            case .signedIn:
                completion(.signedIn)
            default:
                completion(.signedOut)
            }
        }
    }
    
    func signIn(username: String, password: String, completion: @escaping SignInResponse) {
        AWSMobileClient.default().signIn(username:  username,
                                         password: password,
                                         completionHandler: { (state, err) in
             if err != nil {
                    completion(.unknown)
                 return
             }
             guard let state = state else {
                 completion(.unknown)
                 return
             }
            completion(state.signInState)
        })
    }
    
    func changePassword(newPassword: String, completion: @escaping SignInResponse) {
        AWSMobileClient.default().confirmSignIn(challengeResponse: newPassword) { (signInResult, error) in
            if error != nil {
                completion(.unknown)
                return
            }
            guard let signInResult = signInResult else {
                completion(.unknown)
                return
            }
            completion(signInResult.signInState)
        }
    }
}
