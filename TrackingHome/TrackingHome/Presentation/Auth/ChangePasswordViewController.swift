//
//  ChangePasswordViewController.swift
//  TrackingHome
//
//  Created by Mario Acero on 2020-04-05.
//  Copyright © 2020 Mario Acero. All rights reserved.
//

import UIKit

class ChangePasswordViewController: UIViewController {

    @IBOutlet weak var changePassButton: UIButton!
    
    var viewModel = ChangePassViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBinding()
    }
    
    func setBinding() {
        viewModel.isLoading = {[weak self] (isLoading) in
            guard let strongSelf = self else { return }
            
            if isLoading {
                strongSelf.showSpinner(onView: strongSelf.view)
                return
            }
            strongSelf.removeSpinner()
        }
        
        viewModel.redirectHome = {() in
            DispatchQueue.main.async {
                let mainStoryboard = R.storyboard.main()
                let controller = mainStoryboard.instantiateInitialViewController()
                UIApplication.shared.windows.first?.rootViewController = controller
                UIApplication.shared.windows.first?.makeKeyAndVisible()
            }
        }
    }
    
    @IBAction func changePass(_ sender: Any) {
        viewModel.changePassword(newPassword: "Alejandro123")
    }
    
}
