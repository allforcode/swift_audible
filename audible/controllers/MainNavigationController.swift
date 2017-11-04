//
//  MainNavigationController.swift
//  audible
//
//  Created by Paul Dong on 4/11/17.
//  Copyright © 2017 Paul Dong. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        if isLoggedIn() {
            let homeController = HomeController()
            viewControllers = [homeController]
        } else {
            perform(#selector(showLoginController), with: true, afterDelay: 0.01)
        }
    }
    
    func isLoggedIn() -> Bool{
        return UserDefaults.standard.isLoggedIn()
    }
    
    func showLoginController() {
        let loginController = LoginController()
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
            self.present(loginController, animated: false, completion: nil)
        }, completion: nil)
    }
}
