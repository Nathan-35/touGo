//
//  TouristViewController.swift
//  GuideFinder(Test)
//
//  Created by Nathan on 01/09/2019.
//  Copyright © 2019 Nathan. All rights reserved.
//

import UIKit
import RealmSwift

class TouristSignInVC: UIViewController, UITextFieldDelegate {
    
    var tourists : Results<Tourist>!
    private var imageView = UIImageView()
    private var image = UIImage(named: "Authorization2.0")
    private var emailTextField = ShakeTextField()
    private var passwordTextField = ShakeTextField()
    private var iconButton = UIButton()
    private var emailLabel = UILabel()
    private var passwordLabel = UILabel()
    private var purpleColor = #colorLiteral(red: 0.9536519647, green: 0.3652561605, blue: 0.601695478, alpha: 1).cgColor
    private var signInButton = ButtonPush()
    private var signUpLabel = UILabel()
    private var signUpButton = UIButton()
    private var forgotButton = UIButton()
    private var mainColor = #colorLiteral(red: 0.9536519647, green: 0.3652560711, blue: 0.601695478, alpha: 1)
    private var eye = ButtonPush()
    //private var gradient = Colors()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createViews()
        
    }
    
    private func createViews() {
        pushAndHideBack()
        createBackground()
        createNameTextField()
        createPasswordTextField()
        createEye()
        createNextButton()
        createNameLabel()
        createPasswordLabel()
        createSignInButton()
        createSignUpLabel()
        createSignUpButton()
        createForgotButton()
        //createGradient()
    }
    
//    private func createGradient() {
//        view.backgroundColor = UIColor.clear
//        let grad = gradient.gl
//        grad?.frame = view.frame
//        view.layer.insertSublayer(grad!, at: 0)
//    }
//
//    private func createGradientForButton() {
//        signInButton.backgroundColor = UIColor.clear
//        let gradient1 = gradient.gl
//        gradient1?.frame = signInButton.frame
//        signInButton.layer.insertSublayer(gradient1!, at: 2)
//    }
    
    private func createBackground() {
        imageView = UIImageView(frame: view.bounds)
        imageView.image = image
        imageView.center = view.center
        view.addSubview(imageView)
    }
    
    private func createNameLabel() {
        emailLabel.frame = CGRect(x: view.bounds.minX + 38, y: emailTextField.center.y - 40, width: view.bounds.maxX - 75, height: 25)
        emailLabel.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        emailLabel.text = "Email"
        emailLabel.font = UIFont(name: "Helvetica", size: 16.5)
        view.addSubview(emailLabel)
    }
    
//    private func defaultImage(){
//        let tourist = tourists
//        //iconButton.setImage(UIImage(named: tourist), for: .normal)
//        //iconButton.currentImage = tourist! as UIImage
//
//
//    }
    
    private func createNameTextField() {
        emailTextField.frame = CGRect(x: view.bounds.minX + 38, y: view.center.y + 5, width: view.bounds.maxX - 75, height: 30)
        emailTextField.backgroundColor = .white
        emailTextField.keyboardAppearance = .dark
        emailTextField.clearButtonMode = .whileEditing
        emailTextField.keyboardType = .emailAddress
        emailTextField.textColor = .black
        emailTextField.autocorrectionType = .no
        emailTextField.returnKeyType = .next
        emailTextField.layer.shadowColor = UIColor.lightGray.cgColor
        emailTextField.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        emailTextField.layer.shadowOpacity = 1.0
        emailTextField.layer.shadowRadius = 0.0
        emailTextField.delegate = self
        emailTextField.addTarget(self, action: #selector(colorTextField(param:)), for: .editingChanged)
        view.addSubview(emailTextField)
    }
    
    private func createPasswordLabel() {
        passwordLabel.frame = CGRect(x: view.bounds.minX + 38, y: view.center.y + 50, width: view.bounds.maxX - 75, height: 25)
        passwordLabel.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        passwordLabel.text = "Password"
        passwordLabel.font = UIFont(name: "Helvetica", size: 16.5)
        view.addSubview(passwordLabel)
    }
    
    private func createPasswordTextField() {
        passwordTextField.frame = CGRect(x: view.bounds.minX + 37.5, y: view.center.y + 75, width: view.bounds.maxX - 75, height: 30)
        passwordTextField.backgroundColor = .white
        passwordTextField.keyboardAppearance = .dark
        passwordTextField.textColor = .black
        passwordTextField.autocapitalizationType = .none
        passwordTextField.autocorrectionType = .no
        passwordTextField.returnKeyType = .done
        passwordTextField.layer.shadowColor = UIColor.lightGray.cgColor
        passwordTextField.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        passwordTextField.layer.shadowOpacity = 1.0
        passwordTextField.layer.shadowRadius = 0.0
        passwordTextField.isSecureTextEntry = true
        passwordTextField.delegate = self
        passwordTextField.addTarget(self, action: #selector(colorTextField(param:)), for: .editingChanged)
        view.addSubview(passwordTextField)
    }
    
    private func createEye() {
        eye.frame = CGRect(x: passwordTextField.bounds.maxX, y: passwordTextField.center.y - 20, width: 32, height: 32)
        eye.setImage(UIImage(named: "lock"), for: .normal)
        eye.adjustsImageWhenHighlighted = false
        eye.addTarget(self, action: #selector(changeIcon(param:)), for: .touchUpInside)
        eye.addTarget(self, action: #selector(changeKeyboard(param:)), for: .touchUpInside)
        eye.addTarget(self, action: #selector(eyePush(param:)), for: .touchUpInside)
        self.view.addSubview(eye)
    }
    
    private func createSignInButton() {
        signInButton.frame = CGRect(x: view.bounds.minX + 37, y: view.center.y + 160, width: view.bounds.maxX - 76, height: 50)
        signInButton.backgroundColor = mainColor
        signInButton.setTitle("Sign in", for: .normal)
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.layer.cornerRadius = 5
        signInButton.titleLabel?.font = UIFont(name: "Helvetica", size: 18)
        signInButton.addTarget(self, action: #selector(emptyTF(param:)), for: .touchUpInside)
        view.addSubview(signInButton)
    }
    
    private func createSignUpLabel() {
        signUpLabel.frame = CGRect(x: view.bounds.minX + 75, y: signInButton.center.y + 50, width: view.bounds.maxX - 230, height: 20)
        signUpLabel.text = "Create an account?"
        signUpLabel.font = UIFont(name: "Helvetica", size: 15)
        signUpLabel.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        signUpLabel.sizeToFit()
        view.addSubview(signUpLabel)
    }
    
    private func createSignUpButton() {
        signUpButton.frame = CGRect(x: signUpLabel.bounds.maxX + 105, y: signInButton.center.y + 45, width: view.bounds.maxX - 100, height: 20)
        signUpButton.setTitle("Sign up", for: .normal)
        signUpButton.setTitleColor(mainColor, for: .normal)
        signUpButton.titleLabel?.font = UIFont(name: "Helvetica", size: 15)
        signUpButton.sizeToFit()
        signUpButton.addTarget(self, action: #selector(pushSignUp), for: .touchUpInside)
        view.addSubview(signUpButton)
    }
    
    private func createForgotButton() {
        forgotButton.frame = CGRect(x: view.bounds.minX + 120, y: view.center.y + 45, width: 0, height: 0)
        forgotButton.setTitle("Forgot?", for: .normal)
        forgotButton.sizeToFit()
        forgotButton.setTitleColor(mainColor, for: .normal)
        forgotButton.titleLabel?.font = UIFont(name: "Helvetica", size: 16.5)
        forgotButton.addTarget(self, action: #selector(pushForgotPassword), for: .touchUpInside)
        view.addSubview(forgotButton)
    }
    
    private func createNextButton() {
        iconButton.frame = CGRect(x: 100, y: 70, width: 100, height: 100)
        iconButton.layer.cornerRadius = iconButton.frame.size.height / 2
        iconButton.setImage(UIImage(named: "travel"), for: .normal)
        iconButton.layer.shadowColor = UIColor.black.cgColor
        iconButton.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        iconButton.layer.shadowRadius = 5
        iconButton.layer.shadowOpacity = 0.5
        iconButton.adjustsImageWhenHighlighted = false
        view.addSubview(iconButton)
    }
    
    private func pushAndHideBack() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        let back = UIBarButtonItem()
        navigationItem.leftBarButtonItem = back
        back.isEnabled = false
    }
    
    private func keyboard() {
            NotificationCenter.default.addObserver(forName: UIWindow.keyboardWillShowNotification, object: nil, queue: nil) { (kb) in
                self.view.frame.origin.y = -45.0
            NotificationCenter.default.addObserver(forName: UIWindow.keyboardWillHideNotification, object: nil, queue: nil) { (kb) in
                self.view.frame.origin.y = 0.0
            }
        }
    }
    
    @objc func changeIcon(param:Any) {
        if eye.currentImage == UIImage(named: "lock") {
            eye.setImage(UIImage(named: "unlock"), for: .normal)
        } else {
            eye.setImage(UIImage(named: "lock"), for: .normal)
        }
    }
    
    @objc func eyePush(param: ButtonPush) {
        eye.createPushAnimation()
    }
    
    @objc func changeKeyboard(param:Any) {
        if passwordTextField.isSecureTextEntry == true {
            passwordTextField.isSecureTextEntry = false
        } else {
            passwordTextField.isSecureTextEntry = true
        }
        
    }
    
    @objc func pushSignIn() {
        signInButton.createPushAnimation()
        let mainVC = TouristTabBarVC()  //TouristMainVC
        navigationController?.pushViewController(mainVC, animated: true)
    }
    
    @objc func pushSignUp() {
        let signUpVC = TouristSignUpVC()
        present(signUpVC, animated: true, completion: nil)
    }
    
    @objc func pushForgotPassword() {
        let forgotPasswordVC = ForgotPasswordVC()
        navigationController?.pushViewController(forgotPasswordVC, animated: true)
    }
    
    @objc func colorTextField(param: Any) {
        if emailTextField.text!.count >= 1 && passwordTextField.text!.count >= 1 {
            emailTextField.layer.shadowColor = purpleColor
            emailTextField.backgroundColor = .white
            passwordTextField.layer.shadowColor = purpleColor
            passwordTextField.backgroundColor = .white
        } else if emailTextField.text!.count >= 1 {
            emailTextField.layer.shadowColor = purpleColor
        } else if passwordTextField.text!.count >= 1 {
            passwordTextField.layer.shadowColor = purpleColor
        } else {
            emailTextField.layer.shadowColor = UIColor.lightGray.cgColor
            passwordTextField.layer.shadowColor = UIColor.lightGray.cgColor
        }
    }
    
    @objc func emptyTF(param: ShakeTextField) {
        if emailTextField.text!.count == 0 && passwordTextField.text!.count == 0 {
            emailTextField.createShakeAnimation()
            emailTextField.layer.shadowColor = UIColor.red.cgColor
            passwordTextField.createShakeAnimation()
            passwordTextField.layer.shadowColor = UIColor.red.cgColor
        } else if emailTextField.text!.count == 0 {
            emailTextField.createShakeAnimation()
            emailTextField.layer.shadowColor = UIColor.red.cgColor
        } else if passwordTextField.text!.count == 0 {
            passwordTextField.createShakeAnimation()
            passwordTextField.layer.shadowColor = UIColor.red.cgColor
        } else if emailTextField.text!.count != 0 && passwordTextField.text!.count != 0 {
            pushSignIn()
        }
    }
    
    @objc func anim() {
        if emailTextField.text!.count >= 1 {
            UIView.animate(withDuration: 1.5) {
                self.iconButton.frame = CGRect(x: self.view.center.x - 50, y: self.emailTextField.center.y - 160, width: 100, height: 100)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.7, execute: {
                    self.iconButton.setImage(UIImage(named: "man-3.0"), for: .normal)
                    self.iconButton.layer.shadowColor = UIColor.black.cgColor
                    self.iconButton.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
                    self.iconButton.layer.shadowRadius = 5
                    self.iconButton.layer.shadowOpacity = 0.5
                })
            }
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == passwordTextField{
            anim()
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        keyboard()
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTextField:
            passwordTextField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return true
    }
    
}


