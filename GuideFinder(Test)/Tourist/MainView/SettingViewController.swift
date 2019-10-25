//
//  SettingViewController.swift
//  GuideFinder(Test)
//
//  Created by Nathan on 19/09/2019.
//  Copyright © 2019 Nathan. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    var switch1 = UISwitch()
    let gpsLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationItem.title = "Favourites"
        //        createSwitch()
        //        createLabel()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
    func createSwitch(){
        switch1.frame = CGRect(x: 300, y: 85, width: 0, height: 0)
        switch1.isOn = true
        switch1.tintColor = .red
        self.view.addSubview(switch1)
    }
    
    func createLabel() {
        gpsLabel.frame = CGRect(x: 30, y: 90, width: 0, height: 0)
        gpsLabel.text = "Геолокация"
        gpsLabel.textColor = .black
        gpsLabel.sizeToFit()
        self.view.addSubview(gpsLabel)
    }
}
