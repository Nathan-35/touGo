//
//  Anim.swift
//  GuideFinder(Test)
//
//  Created by Nathan on 01/09/2019.
//  Copyright © 2019 Nathan. All rights reserved.
//

import UIKit

class Anim: UIButton {
    
    func createShakeAnimation() {
        let shakeAnimation = CABasicAnimation(keyPath: "position")
        
        shakeAnimation.fromValue = NSValue(cgPoint: CGPoint(x: center.x + 187.5, y: center.y))
        shakeAnimation.toValue = NSValue(cgPoint: CGPoint(x: center.x + 187.5, y: center.y))
        shakeAnimation.duration = 1.0
        shakeAnimation.autoreverses = true
        layer.add(shakeAnimation, forKey: nil)
    }

}
