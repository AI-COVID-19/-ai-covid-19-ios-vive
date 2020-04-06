//
//  AuthUseCase.swift
//  TrackingHome
//
//  Created by Mario Acero on 2020-04-05.
//  Copyright © 2020 Mario Acero. All rights reserved.
//

import Foundation

class AuthUseCase {
    var authManager = AuthMananger()
    
    func validateLogin(completion: @escaping loginStatus) {
        authManager.validateUserLoginState { (userState) in
            completion(userState)
        }
    }
    
    func signIn(user: String, pass: String, completion: @escaping SignInResponse) {
        authManager.signIn(username: user, password: pass) { (response) in
            completion(response)
        }
    }
    
    func changePassword(password: String, completion: @escaping SignInResponse) {
        authManager.changePassword(newPassword: password) { (response) in
            completion(response)
        }
    }
}
