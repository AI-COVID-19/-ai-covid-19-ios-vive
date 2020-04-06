//
//  SignInViewController.swift
//  TrackingHome
//
//  Created by Mario Acero on 2020-04-05.
//  Copyright © 2020 Mario Acero. All rights reserved.
//

import UIKit
import PhoneNumberKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var phoneTextField: PhoneTextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    lazy var viewModel = SignInViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signInButton.layer.cornerRadius = 5
        setViewModelBinding()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func setViewModelBinding() {
        viewModel.redirectChangePassword = {() in
            
            DispatchQueue.main.async {
                let authStoryboard: UIStoryboard = R.storyboard.auth()
                let identifier = R.storyboard.auth.changePasswordViewController.identifier
                let controller = authStoryboard.instantiateViewController(withIdentifier: identifier) as! ChangePasswordViewController
                
                UIView.transition(with: UIApplication.shared.windows.first!,
                                  duration: 0.5,
                                  options: UIView.AnimationOptions.transitionFlipFromLeft,
                                  animations: {
                                    
                    UIApplication.shared.windows.first?.rootViewController = controller
                  UIApplication.shared.windows.first?.makeKeyAndVisible()
                }, completion: nil)
                
            }
        }
        
        viewModel.isLoading = {[weak self] (isLoading) in
            guard let strongSelf = self else { return }
            
            if isLoading {
                strongSelf.showSpinner(onView: strongSelf.view)
                return
            }
            strongSelf.removeSpinner()
        }
    }
    
    @IBAction func signInAction(_ sender: Any) {
        if phoneTextField.isValidNumber,let number = phoneTextField.text,
            let password = passwordTextField.text {
                let user = try! phoneTextField.phoneNumberKit.parse(number)
                let format = PhoneNumberKit()
                let number = format.format(user, toType: .e164)
                viewModel.signIn(user: number, password: password)
        }
    }
}
