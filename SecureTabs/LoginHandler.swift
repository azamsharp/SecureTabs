//
//  LoginHandler.swift
//  SecureTabs
//
//  Created by Mohammad Azam on 5/4/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

protocol LoginHandler : class {
    func validate() -> Bool
}

extension LoginHandler where Self : UIViewController {
    
    func validate() -> Bool {
        // call the validation service here which will validate the user
        return false
    }
}


