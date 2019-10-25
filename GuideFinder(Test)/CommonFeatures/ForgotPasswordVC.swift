//
//  ForgotPasswordVC.swift
//  GuideFinder(Test)
//
//  Created by Nathan on 06/09/2019.
//  Copyright © 2019 Nathan. All rights reserved.
//

import UIKit

class ForgotPasswordVC: UIViewController {

    private var backButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createBackButton()
        
    }
    
    
    func createBackButton(){
        backButton.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        backButton.center = view.center
        backButton.setTitle("Back", for: .normal)
        backButton.backgroundColor = .blue
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        view.addSubview(backButton)
    }
    
    @objc func back(){
        self.navigationController?.popToViewController((self.navigationController?.viewControllers[1]) as! TouristSignInVC, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
