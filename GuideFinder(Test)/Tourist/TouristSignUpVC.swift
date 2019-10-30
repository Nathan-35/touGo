//
//  TouristSignUpVC.swift
//  GuideFinder(Test)
//
//  Created by Nathan on 06/09/2019.
//  Copyright © 2019 Nathan. All rights reserved.
//

import UIKit
import RealmSwift

class TouristSignUpVC: UIViewController, UITextFieldDelegate, UIViewControllerTransitioningDelegate, UINavigationControllerDelegate {
    
    private var imageView = UIImageView()
    private var image = UIImage(named: "Authorization2.0")
    private var emailTextField = ShakeTextField()
    private var passwordTextField = ShakeTextField()
    private var avatarButton = UIButton()
    private var nameLabel = UILabel()
    private var passwordLabel = UILabel()
    private var purpleColor = #colorLiteral(red: 0.9536519647, green: 0.3652561605, blue: 0.601695478, alpha: 1).cgColor
    private var signUpLabel = UILabel()
    private var signUpButton = UIButton()
    private var forgotButton = UIButton()
    private var mainColor = #colorLiteral(red: 0.9536519647, green: 0.3652561605, blue: 0.601695478, alpha: 1)
    private var passwordLabel2 = UILabel()
    private var confirmLabel = UILabel()
    private var passwordTextField2 = UITextField()
    private var backToSignInButton = UIButton()
    private var imageIsChanged = false
    let transiton = CircularTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createViews()
        
    }
    
    private func createViews() {
        createBackground()
        createEmailLabel()
        createEmailTextField()
        createNextButton()
        createPasswordLabel()
        createPasswordTextField()
        createSignUpButton()
        createPasswordLabel2()
        createPasswordTextField2()
        createBackButton()
        createConfirmLabel()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let avatarVC = segue.destination as! AvatarsViewController
        avatarVC.transitioningDelegate = self
        avatarVC.modalPresentationStyle = .custom
    }
    
    private func animationController(forPresented presented: LaunchVC, presenting: LaunchVC, source: LaunchVC) -> UIViewControllerAnimatedTransitioning? {
        transiton.transitionMode = .present
        transiton.startingPoint = avatarButton.center
        transiton.circleColor = avatarButton.backgroundColor!
        return transiton
    }
    
    private func animationController(forDismissed dismissed: TouristSignInVC) -> UIViewControllerAnimatedTransitioning? {
        transiton.transitionMode = .dismiss
        transiton.startingPoint = avatarButton.center
        transiton.circleColor = avatarButton.backgroundColor!
        return transiton
    }
    
    private func createBackground() {
        imageView = UIImageView(frame: view.bounds)
        imageView.image = image
        imageView.center = view.center
        view.addSubview(imageView)
    }
    
    private func createEmailLabel() {
        nameLabel.frame = CGRect(x: view.bounds.minX + 38, y: view.center.y - 20, width: view.bounds.maxX - 75, height: 25)
        nameLabel.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        nameLabel.text = "Email"
        nameLabel.font = UIFont(name: "Helvetica", size: 16.5)
        view.addSubview(nameLabel)
    }
    
    private func createEmailTextField() {
        emailTextField.frame = CGRect(x: view.bounds.minX + 38, y: view.center.y + 5, width: view.bounds.maxX - 75, height: 30)
        emailTextField.backgroundColor = .white
        emailTextField.keyboardAppearance = .dark
        emailTextField.clearButtonMode = .whileEditing
        emailTextField.autocorrectionType = .no
        emailTextField.returnKeyType = .next
        emailTextField.layer.shadowColor = UIColor.lightGray.cgColor
        emailTextField.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        emailTextField.layer.shadowOpacity = 1.0
        emailTextField.layer.shadowRadius = 0.0
        emailTextField.textColor = .black
        emailTextField.keyboardType = .emailAddress
        emailTextField.delegate = self   
        emailTextField.addTarget(self, action: #selector(textFieldisFull), for: .editingChanged)
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
        //passwordTextField.placeholder = "Enter password"
        passwordTextField.backgroundColor = .white
        passwordTextField.keyboardAppearance = .dark
        passwordTextField.clearButtonMode = .whileEditing
        passwordTextField.autocapitalizationType = .none
        passwordTextField.autocorrectionType = .no
        passwordTextField.returnKeyType = .next
        passwordTextField.layer.shadowColor = UIColor.lightGray.cgColor
        passwordTextField.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        passwordTextField.layer.shadowOpacity = 1.0
        passwordTextField.layer.shadowRadius = 0.0
        passwordTextField.isSecureTextEntry = true
        passwordTextField.textColor = .black
        passwordTextField.delegate = self
        passwordTextField.addTarget(self, action: #selector(textFieldisFull), for: .editingChanged)
        view.addSubview(passwordTextField)
    }
    
    private func createPasswordLabel2() {
        passwordLabel2.frame = CGRect(x: view.bounds.minX + 38, y: view.center.y + 120, width: 150, height: 25)
        passwordLabel2.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        //passwordLabel2.backgroundColor = .red
        passwordLabel2.text = "Confirm password"
        passwordLabel2.font = UIFont(name: "Helvetica", size: 16.5)
        view.addSubview(passwordLabel2)
    }
    
    private func createConfirmLabel() {
        confirmLabel.frame = CGRect(x: passwordLabel2.bounds.maxX + 30, y: view.center.y + 120, width: 200, height: 25)
        confirmLabel.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        confirmLabel.text = "Passwords aren't same"
        confirmLabel.font = UIFont(name: "Helvetica", size: 16.5)
        confirmLabel.isHidden = true
        view.addSubview(confirmLabel)
    }
    
    private func createPasswordTextField2() {
        passwordTextField2.frame = CGRect(x: view.bounds.minX + 37.5, y: view.center.y + 145, width: view.bounds.maxX - 75, height: 30)
        passwordTextField2.backgroundColor = .white
        passwordTextField2.keyboardAppearance = .dark
        passwordTextField2.clearButtonMode = .whileEditing
        passwordTextField2.autocapitalizationType = .none
        passwordTextField2.autocorrectionType = .no
        passwordTextField2.returnKeyType = .done
        passwordTextField2.layer.shadowColor = UIColor.lightGray.cgColor
        passwordTextField2.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        passwordTextField2.layer.shadowOpacity = 1.0
        passwordTextField2.layer.shadowRadius = 0.0
        passwordTextField2.isSecureTextEntry = true
        passwordTextField2.textColor = .black
        passwordTextField2.delegate = self
        passwordTextField2.addTarget(self, action: #selector(textFieldisFull), for: .editingChanged)
        view.addSubview(passwordTextField2)
    }
    
    private func createSignUpButton() {
        signUpButton.frame = CGRect(x: view.bounds.minX + 37, y: view.center.y + 230, width: view.bounds.maxX - 76, height: 50)
        signUpButton.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        signUpButton.setTitle("Sign up", for: .normal)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.layer.cornerRadius = 5
        signUpButton.titleLabel?.font = UIFont(name: "Helvetica", size: 18)
        signUpButton.addTarget(self, action: #selector(backToSignInVC(param:)), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(createAccount), for: .touchUpInside)
        view.addSubview(signUpButton)
    }
    
    func createBackButton() {
        backToSignInButton.frame = CGRect(x: 25, y: 55, width: 40, height: 40)
        backToSignInButton.setImage(UIImage(named: "back2.0"), for: .normal)
        backToSignInButton.adjustsImageWhenHighlighted = false
        backToSignInButton.addTarget(self, action: #selector(backToSignInVC(param:)), for: .touchUpInside)
        view.addSubview(backToSignInButton)
    }
    
    private func createNextButton() {
        avatarButton.frame = CGRect(x: view.center.x - 50, y: self.emailTextField.center.y - 180, width: 100, height: 100)
        avatarButton.layer.cornerRadius = avatarButton.frame.size.height / 2
        avatarButton.setImage(UIImage(named: "addUser-3"), for: .normal)
        avatarButton.layer.shadowColor = UIColor.black.cgColor
        avatarButton.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        avatarButton.layer.shadowRadius = 5
        avatarButton.layer.shadowOpacity = 0.5
        avatarButton.adjustsImageWhenHighlighted = false
        avatarButton.addTarget(self, action: #selector(chooseAvatar), for: .touchUpInside)
        view.addSubview(avatarButton)
    }
   
    @objc func chooseAvatar(){
        let layout = UICollectionViewFlowLayout()
        let avatarVC = AvatarsViewController(collectionViewLayout: layout)
        present(avatarVC, animated: true)
    }
    
    
    
    @objc func backToSignInVC(param: Any) {
       // let image = imageIsChanged ? avatarButton.imageView?.image : #imageLiteral(resourceName: "man-3.0")
        dismiss(animated: true, completion: nil)
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailTextField{
            confirmLabel.isHidden = true
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if (textField == passwordTextField2 && passwordTextField.text != passwordTextField2.text){
            confirmLabel.isHidden = false
        }
    }
    
    @objc func textFieldisFull(){
        if (emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty || passwordTextField2.text!.isEmpty || passwordTextField.text != passwordTextField2.text){
            signUpButton.isEnabled = false
            signUpButton.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            confirmLabel.isHidden = true
        } else {
            signUpButton.isEnabled = true
            signUpButton.backgroundColor = mainColor
            passwordLabel.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            passwordLabel2.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        }
    }

    
    @objc func fullAnimation(param: Any) {
        let avatarVC = AvatarsViewController()
        present(avatarVC, animated: true, completion: nil)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        passwordTextField2.resignFirstResponder()
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        keyboard()
        return true
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            passwordTextField2.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return true
    }
    
    private func keyboard() {
            NotificationCenter.default.addObserver(forName: UIWindow.keyboardWillShowNotification, object: nil, queue: nil) { (kb) in
                self.view.frame.origin.y = -self.view.bounds.height / 3
            NotificationCenter.default.addObserver(forName: UIWindow.keyboardWillHideNotification, object: nil, queue: nil) { (kb) in
                self.view.frame.origin.y = 0.0
            }
        }
    }
    @objc func createAccount(){
        let tourist = Tourist()

        tourist.name = emailTextField.text ?? ""
        tourist.password = passwordTextField.text ?? ""


        StorageManager.saveTourist(tourist)
    }
}


