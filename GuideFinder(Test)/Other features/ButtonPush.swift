//
//  ButtonPush.swift
//  GuideFinder(Test)
//
//  Created by Nathan on 06/09/2019.
//  Copyright © 2019 Nathan. All rights reserved.
//

import UIKit

class ButtonPush: UIButton {

    func createPushAnimation(){
        
        let pushButton = CASpringAnimation(keyPath: "transform.scale")
        pushButton.duration = 0.3
        pushButton.fromValue = 0.8 
        pushButton.toValue = 1.0
        pushButton.repeatCount = 0.3
        pushButton.autoreverses = true
        pushButton.initialVelocity = 0.3
        pushButton.damping = 1.0
        
        layer.add(pushButton, forKey: nil)
    }


}
