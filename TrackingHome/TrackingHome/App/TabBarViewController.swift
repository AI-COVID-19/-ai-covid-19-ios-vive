//
//  TabBarViewController.swift
//  TrackingHome
//
//  Created by Mario Acero on 2020-04-01.
//  Copyright © 2020 Mario Acero. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setupMiddleButton()
    }
        
    required init(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)!
     }
    

    func setupMiddleButton() {
        let middleBtn = UIButton(frame: CGRect(x: (self.view.bounds.width / 2)-35, y: -38, width: 70, height: 70))
        middleBtn.backgroundColor = R.color.primary()
        middleBtn.layer.cornerRadius = 35
        middleBtn.setImage(R.image.phone(), for: .normal)
        middleBtn.imageView?.contentMode = .scaleAspectFit
        middleBtn.clipsToBounds = true
        self.tabBar.addSubview(middleBtn)
        middleBtn.addTarget(self, action: #selector(self.menuButtonAction), for: .touchUpInside)
        self.view.layoutIfNeeded()
    }

    @objc func menuButtonAction(sender: UIButton) {
        print("trigger call")
    }
}
