//
//  ViewController.swift
//  NextEon Tap
//
//  Created by Justin on 9/17/18.
//  Copyright © 2017 Justin. All rights reserved.
//

import UIKit
//import AWSCognitoIdentityProvider

class LoginVC: UIViewController {
    
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var imgBackground: UIImageView!
    @IBOutlet weak var btnLogin: UIButton!
    
    //    var passwordAuthenticationCompletion: AWSTaskCompletionSource<AWSCognitoIdentityPasswordAuthenticationDetails>?
    var usernameText: String?
    @IBOutlet weak var viewLogin: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            self.imgLogo.layer.shadowRadius = 3
            self.imgLogo.layer.shadowColor = UIColor.blue.cgColor
            self.imgLogo.layer.shadowOffset = CGSize.zero
            self.imgLogo.layer.shadowOpacity = 0.8
            
            self.btnLogin.layer.shadowRadius = 5
            self.btnLogin.layer.shadowColor = UIColor.blue.cgColor
            self.btnLogin.layer.shadowOffset = CGSize.zero
            self.btnLogin.layer.shadowOpacity = 0.5
        }

        
        //background motion effect
        let horizontalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        horizontalMotionEffect.minimumRelativeValue = -200
        horizontalMotionEffect.maximumRelativeValue = 200
        
        let verticalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        verticalMotionEffect.minimumRelativeValue = -200
        verticalMotionEffect.maximumRelativeValue = 200
        
        let motionEffectGroup = UIMotionEffectGroup()
        motionEffectGroup.motionEffects = [horizontalMotionEffect, verticalMotionEffect]
        
        imgBackground.addMotionEffect(motionEffectGroup)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.imgLogo.alpha = 1.0
        DispatchQueue.main.async {
            self.logoAnimationIn()
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Hide the navigation bar for current view controller
        self.navigationController?.isNavigationBarHidden = true;
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.txtPassword.text = nil
        self.txtUsername.text = usernameText
        // Show the navigation bar on other view controllers
        self.navigationController?.isNavigationBarHidden = false;
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.viewLogin.frame.origin.y == 0{
                self.viewLogin.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.viewLogin.frame.origin.y != 0{
                self.viewLogin.frame.origin.y += keyboardSize.height
            }
        }
    }
    
    func logoAnimationIn(){
        imgLogo.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        UIView.animate(withDuration: 1.5,
                       delay: 0,
                       usingSpringWithDamping: 0.3,
                       initialSpringVelocity: 3.0,
                       options: .allowUserInteraction,
                       animations: { [weak self] in
                        self?.imgLogo.transform = .identity
            },
                       completion: nil)
        
    }
    func logoAnimationOut(){
        UIView.animate(withDuration: 0.5, animations: {
            self.imgLogo.alpha = 0.0
        })
    }
    
    @IBAction func btnLoginPress(_ sender: Any) {
        logoAnimationIn()
        //        if (self.txtUsername.text != nil && self.txtPassword.text != nil) {
        //            let authDetails = AWSCognitoIdentityPasswordAuthenticationDetails(username: self.txtUsername.text!, password: self.txtPassword.text! )
        //            self.passwordAuthenticationCompletion?.set(result: authDetails)
        //            print("Auth Pass")
        //        } else {
        //            let alertController = UIAlertController(title: "Missing information",
        //                                                    message: "Please enter a valid user name and password",
        //                                                    preferredStyle: .alert)
        //            let retryAction = UIAlertAction(title: "Retry", style: .default, handler: nil)
        //            alertController.addAction(retryAction)
        //        }
        if (txtUsername.text == "Justin" && txtPassword.text == "Test"){
            logoAnimationOut()
            UserDefaults.standard.set(true, forKey: "status")
            
        } else {
            let message = "Verify Username & Password and try again"
            let alert = UIAlertController(title: "Login Incorrect", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        
    }
    // MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            //relabel back button
            let btnBack = UIBarButtonItem()
            btnBack.title = "Logout"
            navigationItem.backBarButtonItem = btnBack
    }
    
}
//extension LoginVC: AWSCognitoIdentityPasswordAuthentication {
//
//    public func getDetails(_ authenticationInput: AWSCognitoIdentityPasswordAuthenticationInput, passwordAuthenticationCompletionSource: AWSTaskCompletionSource<AWSCognitoIdentityPasswordAuthenticationDetails>) {
//        self.passwordAuthenticationCompletion = passwordAuthenticationCompletionSource
//        DispatchQueue.main.async {
//            if (self.txtUsername == nil) {
//                self.usernameText = authenticationInput.lastKnownUsername
//            }
//        }
//    }
//
//    public func didCompleteStepWithError(_ error: Error?) {
//        DispatchQueue.main.async {
//            if let error = error as NSError? {
//                let alertController = UIAlertController(title: error.userInfo["__type"] as? String,
//                                                        message: error.userInfo["message"] as? String,
//                                                        preferredStyle: .alert)
//                let retryAction = UIAlertAction(title: "Retry", style: .default, handler: nil)
//                alertController.addAction(retryAction)
//
//                self.present(alertController, animated: true, completion:  nil)
//            } else {
//                self.txtUsername.text = nil
//                self.dismiss(animated: true, completion: nil)
//            }
//        }
//    }
//}

