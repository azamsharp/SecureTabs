//
//  LoginViewController.swift
//  SecureTabs
//
//  Created by Mohammad Azam on 5/4/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

protocol LoginViewControllerDelegate {
    func loginViewControllerDidLoginSuccessfully(controller: UIViewController)
}

class LoginViewController : UIViewController {
    
    var delegate: LoginViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func login() {
       
        if let delegate = delegate {
            delegate.loginViewControllerDidLoginSuccessfully(controller: self)
        }
    }
    
    @IBAction func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
