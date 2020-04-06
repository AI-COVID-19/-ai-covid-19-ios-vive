//
//  SplashViewModel.swift
//  TrackingHome
//
//  Created by Mario Acero on 2020-04-05.
//  Copyright © 2020 Mario Acero. All rights reserved.
//

import Foundation

class SplashViewModel {
    
    var useCase = AuthUseCase()
    
    //Binding
    var redirectHome: (()-> Void)?
    var redirectLogIn: (()-> Void)?
    
    func validateUserLogin() {
        useCase.validateLogin { [weak self] (status) in
            guard let strongSelf = self else { return }
            
            switch status {
            case .signedIn:
                strongSelf.redirectHome?()
            case .signedOut:
                strongSelf.redirectLogIn?()
            }
        }
    }
    
}
