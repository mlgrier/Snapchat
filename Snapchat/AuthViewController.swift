//
//  ViewController.swift
//  Snapchat
//
//  Created by Marco Grier on 9/2/17.
//  Copyright © 2017 Marco Grier. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class AuthViewController: UIViewController {

    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var loginMode = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    

    @IBAction func loginTapped(_ sender: Any) {
        
        if let email = emailTextField.text {
            if let password = passwordTextField.text {
                if loginMode {
                    // Login
                    Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                        if let error = error {
                            print(error)
                        } else {
                            print("Login Successful!")
                            performSegue(withIdentifier: "authToSnaps", sender: nil)
                        }
                    })
                } else {
                    // Sign Up
                    Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                        if let error = error {
                            print(error)
                        } else {
                            print("Sign Up Successful!")
                            performSegue(withIdentifier: "authToSnaps", sender: nil)
                        }
                    })
                }
            }
        }
        
    
        
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        
        if loginMode {
            // Switch to Sign Up
            topButton.setTitle("Sign Up", for: .normal)
            bottomButton.setTitle("Switch to Login", for: .normal)
            loginMode = false
        } else {
            // Switch to Login
            topButton.setTitle("Login", for: .normal)
            bottomButton.setTitle("Switch to Sign Up", for: .normal)
            loginMode = true
        }
        
    }
    
}

