//
//  ViewController.swift
//  GuideFinder(Test)
//
//  Created by Nathan on 01/09/2019.
//  Copyright © 2019 Nathan. All rights reserved.
//

import UIKit

class LaunchVC: UIViewController, UINavigationControllerDelegate {
    
    private var guideLabel = UILabel()
    private var touristLabel = UILabel()
    private var tourist = UIButton()
    private var guide = UIButton()
    private var submitButton = UIButton()
    private var cancelButton = UIButton()
    private var image = UIImageView()
    private let delay = 0.2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        moonButton()
        guideButton()
        touristText()
        guideText()
        createSubmitButton()
        createCancelButton()
        
    }
    
    private func moonButton() {
        tourist.frame = CGRect(x: -187.5, y: 0, width: 375, height: 812)
        tourist.setImage(UIImage(named: "touristBack"), for: .normal)
        //tourist.addTarget(self, action: #selector(moonAnim(param:)), for: .touchUpInside)
        tourist.addTarget(self, action: #selector(moonAnim(param:)), for: .allTouchEvents)
        tourist.adjustsImageWhenHighlighted = false
        view.addSubview(tourist)
    }
    
    private func guideButton() {
        guide.frame = CGRect(x: 187.5, y: 0, width: 375, height: 812)
        guide.setImage(UIImage(named: "guideBack"), for: .normal)
        guide.addTarget(self, action: #selector(guideAnim(param:)), for: .allEvents)
        guide.adjustsImageWhenHighlighted = false
        view.addSubview(guide)
    }
    
    private func touristText() {
        touristLabel.frame = CGRect(x: 25, y: 70, width: 130, height: 30)
        touristLabel.text = "Are you tourist?"
        touristLabel.font = UIFont(name: "Helvetica", size: 20)
        touristLabel.adjustsFontSizeToFitWidth = true
        touristLabel.textColor = .white
        view.addSubview(touristLabel)
        
    }
    
    private func guideText() {
        guideLabel.frame = CGRect(x: 220, y: 70, width: 130, height: 30)
        guideLabel.text = "Are you guide?"
        guideLabel.font = UIFont(name: "Helvetica", size: 20)
        guideLabel.adjustsFontSizeToFitWidth = true
        guideLabel.textColor = .white
        view.addSubview(guideLabel)
    }
    
    private func createSubmitButton() {
        submitButton.frame = CGRect(x: 140, y: 850, width: 200, height: 50)
        submitButton.setTitle("Yes", for: .normal)
        submitButton.layer.cornerRadius = 15
        submitButton.setTitleColor(.white, for: .normal)
       // submitButton.layer.borderWidth = 1
//        submitButton.layer.borderColor = UIColor.green.cgColor
        submitButton.titleLabel?.font = UIFont(name: "Helvetica", size: 24)
        submitButton.addTarget(self, action: #selector(submitButtonTap(param:)), for: .touchUpInside)
        view.addSubview(submitButton)
    }
    
    private func createCancelButton() {
        cancelButton.frame = CGRect(x: 140, y: 850, width: 200, height: 50)
        cancelButton.setTitle("No", for: .normal)
        cancelButton.layer.cornerRadius = 15
        //cancelButton.setTitleColor(.red, for: .normal)
        //cancelButton.layer.borderWidth = 1
//        cancelButton.layer.borderColor = UIColor.red.cgColor
        cancelButton.titleLabel?.font = UIFont(name: "Helvetica", size: 24)
        cancelButton.addTarget(self, action: #selector(cancelAnim(param:)), for: .touchUpInside)
        view.addSubview(cancelButton)
    }
    
    @objc func moonAnim(param: Any) {
        UIView.animate(withDuration: 0.5, delay: delay, options: .showHideTransitionViews, animations: {
            self.submitButton.layer.backgroundColor =  #colorLiteral(red: 0.9536519647, green: 0.3652561605, blue: 0.601695478, alpha: 1).cgColor
            self.cancelButton.layer.backgroundColor = UIColor.white.cgColor
            self.cancelButton.setTitleColor(#colorLiteral(red: 0.9536519647, green: 0.3652561605, blue: 0.601695478, alpha: 1), for: .normal)
            self.animationFrame()
            self.tourist.frame = CGRect(x: 0, y: 0, width: 375, height: 812)
            self.guide.alpha = 0.0
            self.guideLabel.alpha = 0.0
            self.touristLabel.frame = CGRect(x: 130, y: 90, width: 130, height: 30)
        }, completion: nil)
    }
    
    @objc func guideAnim(param: Any) {
        UIView.animate(withDuration: 0.5, delay: delay, options: .showHideTransitionViews, animations: {
            self.submitButton.layer.backgroundColor = #colorLiteral(red: 0.9338732958, green: 0.4356582761, blue: 0.2996177375, alpha: 1).cgColor
            self.cancelButton.layer.backgroundColor = UIColor.white.cgColor
            self.cancelButton.setTitleColor(#colorLiteral(red: 0.9338732958, green: 0.4356582761, blue: 0.2996177375, alpha: 1), for: .normal)
            self.animationFrame()
            self.guide.frame = CGRect(x: 0, y: 0, width: 375, height: 812)
            self.tourist.alpha = 0.0
            self.touristLabel.alpha = 0.0
            self.guideLabel.frame = CGRect(x: 130, y: 90, width: 130, height: 30)
        }, completion: nil)
    }
    
    @objc func cancelAnim(param: Any) {
        if cancelButton.currentTitleColor == #colorLiteral(red: 0.9536519647, green: 0.3652561605, blue: 0.601695478, alpha: 1) {
            UIView.animate(withDuration: 0.5, delay: delay, options: .showHideTransitionViews, animations: {
                self.tourist.frame = CGRect(x: -187.5, y: 0, width: 375, height: 812)
                self.guide.alpha = 1.0
                self.guideLabel.alpha = 1.0
                self.reverseWhenCancel()
            }, completion: nil)
        } else {
            UIView.animate(withDuration: 0.5, delay: delay, options: .showHideTransitionViews, animations: {
                self.guide.frame = CGRect(x: 187.5, y: 0, width: 375, height: 812)
                self.tourist.alpha = 1.0
                self.touristLabel.alpha = 1.0
                self.reverseWhenCancel()
            }, completion: nil)
        }
    }
    
    @objc func submitButtonTap(param: Any) {
        if submitButton.layer.backgroundColor == #colorLiteral(red: 0.9536519647, green: 0.3652561605, blue: 0.601695478, alpha: 1).cgColor{
            let touristVC = TouristSignInVC()
            let transition = CATransition()
            transition.duration = 0.75
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            
            navigationController?.pushViewController(touristVC, animated: true)
            //navigationController?.performSegue(withIdentifier: "tourist", sender: self)
            //            performSegue(withIdentifier: "tourist", sender: self)
            
        } else {
            let guideVC = GuideSignInVC()
            navigationController?.pushViewController(guideVC, animated: true)
            //            navigationController?.setNavigationBarHidden(true, animated: false)
        }
    }
    
    private func reverseWhenCancel() {
        touristLabel.frame = CGRect(x: 25, y: 70, width: 130, height: 30)
        guideLabel.frame = CGRect(x: 220, y: 70, width: 130, height: 30)
        submitButton.frame = CGRect(x: 140, y: 850, width: 200, height: 50)
        cancelButton.frame = CGRect(x: 140, y: 850, width: 200, height: 50)
    }
    
    private func animationFrame() {
        submitButton.frame = CGRect(x: 100, y: 650, width: 200, height: 30)
        cancelButton.frame = CGRect(x: 100, y: 710, width: 200, height: 30)
    }
    
}

