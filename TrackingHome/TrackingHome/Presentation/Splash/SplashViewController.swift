//
//  SplashViewController.swift
//  TrackingHome
//
//  Created by Mario Acero on 2020-04-05.
//  Copyright © 2020 Mario Acero. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    var viewModel = SplashViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModelBinding()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.validateUserLogin()
    }
    
    func viewModelBinding() {
        viewModel.redirectHome = {() in
            let mainStoryboard = R.storyboard.main()
            let controller = mainStoryboard.instantiateInitialViewController()
            UIApplication.shared.windows.first?.rootViewController = controller
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        }
        
        viewModel.redirectLogIn = {() in
            let mainStoryboard = R.storyboard.auth()
            let controller = mainStoryboard.instantiateInitialViewController()
            UIApplication.shared.windows.first?.rootViewController = controller
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        }
    }
    
    
}
