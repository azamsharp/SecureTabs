//
//  BaseTabBarController.swift
//  SecureTabs
//
//  Created by Mohammad Azam on 5/4/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class BaseTabBarController : UITabBarController {
    
    var lastSelectedIndex: Int = 0
}

extension BaseTabBarController: LoginViewControllerDelegate {
    
    func loginViewControllerDidLoginSuccessfully(controller: UIViewController) {
        
        controller.dismiss(animated: true, completion: nil)
        self.selectedIndex = self.lastSelectedIndex
    }
    
}

extension BaseTabBarController : UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        guard let viewControllers = self.viewControllers,
              let index = viewControllers.firstIndex(of: viewController) else {
                fatalError("No selected option..")
        }
        
        self.lastSelectedIndex = index 
        
        guard let controller = viewController as? LoginHandler else {
            return true
        }
        
        let isValid = controller.validate()
        
        if !isValid {
            
            guard let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {
                                fatalError("LoginViewController is not found")
                            }
            
            loginVC.delegate = self
            self.present(loginVC, animated: true, completion: nil)
        }
        
        return isValid
        
    }
    
}
