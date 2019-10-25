//
//  CircularTransition.swift
//  GuideFinder(Test)
//
//  Created by Nathan on 06/09/2019.
//  Copyright © 2019 Nathan. All rights reserved.
//

import UIKit

class CircularTransition: NSObject {

    var circle = UIView()
    
    var startingPoint = CGPoint.zero {
        didSet {
            circle.center = startingPoint
        }
    }
    
    var circleColor = UIColor.white
    
    var duration = 0.5
    
    enum CircularTransitionMode: Int {
        case present, dismiss, pop
    }
    
    var transitionMode: CircularTransitionMode = .present
    
}

extension CircularTransition: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        if transitionMode == .present {
            if let presentedView = transitionContext.view(forKey: UITransitionContextViewKey.to) {
                let viewCenter = presentedView.center
                let viewSize = presentedView.frame.size
                
                circle = UIView()
                circle.frame = frameForCircle(withViewCenter: viewCenter, size: viewSize, startPoint: startingPoint)
                circle.layer.cornerRadius = circle.frame.size.height / 2
                circle.center = startingPoint
                circle.backgroundColor = circleColor
                circle.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                containerView.addSubview(circle)
                
                presentedView.center = startingPoint
                presentedView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                presentedView.alpha = 0
                containerView.addSubview(presentedView)
                
                UIView.animate(withDuration: duration, animations: {
                    self.circle.transform = CGAffineTransform.identity
                    presentedView.transform = CGAffineTransform.identity
                    presentedView.alpha = 1
                    presentedView.center = viewCenter
                }) { (success: Bool) in
                    transitionContext.completeTransition(success)
                }
            }
            
        } else {
            let transitionModeKey = (transitionMode == .pop) ? UITransitionContextViewKey.to : UITransitionContextViewKey.from
            
            if let returnView = transitionContext.view(forKey: transitionModeKey) {
                let viewCenter = returnView.center
                let viewSize = returnView.frame.size
                
                circle.frame = frameForCircle(withViewCenter: viewCenter, size: viewSize, startPoint: startingPoint)
                
                circle.layer.cornerRadius = circle.frame.size.height / 2
                circle.center = startingPoint
                
                UIView.animate(withDuration: duration, animations: {
                    self.circle.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                    returnView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                    returnView.center = self.startingPoint
                    returnView.alpha = 0
                    
                    if self.transitionMode == .pop {
                        containerView.insertSubview(returnView, belowSubview: returnView)
                        containerView.insertSubview(self.circle, belowSubview: returnView)
                    }
                }) { (success: Bool) in
                    returnView.center = viewCenter
                    returnView.removeFromSuperview()
                    self.circle.removeFromSuperview()
                    transitionContext.completeTransition(success)
                }
            }
        }
    }
    
    func frameForCircle (withViewCenter viewCenter: CGPoint, size viewSize: CGSize, startPoint: CGPoint) -> CGRect {
        let xLenght = fmax(startPoint.x, viewSize.width - startPoint.x)
        let yLenght = fmax(startPoint.y, viewSize.height - startPoint.y)
        
        let offestvector = sqrt(xLenght * xLenght + yLenght * yLenght) * 2
        let size = CGSize(width: offestvector, height: offestvector)
        
        return CGRect(origin: CGPoint.zero, size: size)
    }
    
}
