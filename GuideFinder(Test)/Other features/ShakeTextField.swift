//
//  ShakeButton.swift
//  GuideFinder(Test)
//
//  Created by Nathan on 04/09/2019.
//  Copyright © 2019 Nathan. All rights reserved.
//

import UIKit

class ShakeTextField: UITextField {

    func createShakeAnimation() {
        let shakeAnimation = CABasicAnimation(keyPath: "position")
        shakeAnimation.fromValue = NSValue(cgPoint: CGPoint(x: center.x - 5, y: center.y))
        shakeAnimation.toValue = NSValue(cgPoint: CGPoint(x: center.x + 5, y: center.y))
        shakeAnimation.duration = 0.05
        shakeAnimation.repeatCount = 3
        shakeAnimation.autoreverses = true
        
        layer.add(shakeAnimation, forKey: nil)
    }

}
