//
//  SignInViewModel.swift
//  TrackingHome
//
//  Created by Mario Acero on 2020-04-05.
//  Copyright © 2020 Mario Acero. All rights reserved.
//

import Foundation

class SignInViewModel {
    
    let useCase = AuthUseCase()
    
    // Binding
    var redirectHome: (()-> Void)?
    var redirectChangePassword: (()-> Void)?
    var isLoading: ((Bool)-> Void)?
    
    func signIn(user: String, password: String) {
        isLoading?(true)
        useCase.signIn(user: user, pass: password) {[weak self] (result) in
            guard let strongSelf = self else { return }
            strongSelf.isLoading?(false)
            
            switch result {
            case .signedIn:
                strongSelf.redirectHome?()
            case .newPasswordRequired:
                strongSelf.redirectChangePassword?()
            default:
                break
            }
        }
    }
}
