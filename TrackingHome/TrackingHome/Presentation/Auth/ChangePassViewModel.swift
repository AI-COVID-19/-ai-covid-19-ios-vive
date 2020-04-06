//
//  ChangePassViewModel.swift
//  TrackingHome
//
//  Created by Mario Acero on 2020-04-05.
//  Copyright © 2020 Mario Acero. All rights reserved.
//

import Foundation

class ChangePassViewModel {
    
    var useCase = AuthUseCase()
    var isLoading: ((Bool)-> Void)?
    var redirectHome: (()-> Void)?
    
    func changePassword(newPassword: String) {
        isLoading?(true)
        useCase.changePassword(password: newPassword) {[weak self] (result) in
            guard let strongSelf = self else { return }
            strongSelf.isLoading?(false)
            
            switch result {
            case .signedIn:
                strongSelf.redirectHome?()
            default:
                break
            }
            
        }
    }
}
