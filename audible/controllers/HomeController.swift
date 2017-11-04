//
//  HomeController.swift
//  audible
//
//  Created by Paul Dong on 5/11/17.
//  Copyright © 2017 Paul Dong. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(image: UIImage(named: "home"))
        view.addSubview(imageView)
        
        navigationItem.title = "We're logged in"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(handleSignOut))
        
        _ = imageView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 64, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    func handleSignOut(){
        UserDefaults.standard.setLoggedIn(value: false)
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }
}
