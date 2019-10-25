//
//  HomeViewController.swift
//  GuideFinder(Test)
//
//  Created by Nathan on 19/09/2019.
//  Copyright © 2019 Nathan. All rights reserved.
//

import UIKit

class TouristHomeVC: UIViewController, UITextFieldDelegate {
    
    var search = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createBackGround()
        createSearch()
        createAnim()
        navigationController?.navigationBar.backgroundColor = .red
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func createBackGround() {
        //navigationItem.title = "Home"
        //view.backgroundColor = .init(red: 20.0, green: 60.0, blue: 44.0, alpha: 1.0)
        
        //view.backgroundColor = UIColor.black
    }
    
    func createSearch() {
        search.frame = CGRect(x: -320, y: 100, width: 350, height: 30)
        //(x: 12.5, y: 70, width: 350, height: 30)
        //search.center = view.center
        search.placeholder = "Enter a region..."
        search.keyboardAppearance = .dark
        search.clearButtonMode = .whileEditing
        search.rightViewMode = .unlessEditing
        search.autocorrectionType = .no
        search.rightView = UIImageView(image: UIImage(named: "search"))
        search.layer.cornerRadius = 15
        search.borderStyle = .roundedRect
        search.delegate = self
        //self.search.center.x += self.view.bounds.width
        //search.addTarget(self, action: #selector(createAnimation(param:)), for: .touchUpInside)
        self.view.addSubview(search)
    }
    
    @objc func createAnimation(param: Any) {
        
    }
    
    func createAnim() {
        NotificationCenter.default.addObserver(forName: UITextField.keyboardWillShowNotification, object: nil, queue: nil) { (kb) in
            self.search.center.x = 187.0
        }
        
        NotificationCenter.default.addObserver(forName: UITextField.keyboardWillHideNotification, object: nil, queue: nil) { (kb) in
            self.search.center.x = -145.0
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        search.resignFirstResponder()
    }
    
}
