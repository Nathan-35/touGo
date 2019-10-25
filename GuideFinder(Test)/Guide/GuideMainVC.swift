//
//  GuideMainVC.swift
//  GuideFinder(Test)
//
//  Created by Nathan on 17/09/2019.
//  Copyright © 2019 Nathan. All rights reserved.
//

import UIKit

class GuideMainVC: UIViewController {

            private var backButton = UIButton()
            
            override func viewDidLoad() {
                super.viewDidLoad()
                
                createBackButton()
                
            }
            
            private func createBackButton() {
                backButton.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
                backButton.center = view.center
                backButton.setTitle("Back", for: .normal)
                backButton.backgroundColor = #colorLiteral(red: 0.9338732958, green: 0.4356582761, blue: 0.2996177375, alpha: 1)
                backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
                view.addSubview(backButton)
            }
            
            @objc func back() {
                self.navigationController?.popToViewController((self.navigationController?.viewControllers[1]) as! GuideSignInVC, animated: true)
            }
            
    }
