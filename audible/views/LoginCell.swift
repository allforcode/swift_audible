//
//  LoginCell.swift
//  audible
//
//  Created by Paul Dong on 4/11/17.
//  Copyright © 2017 Paul Dong. All rights reserved.
//

import UIKit

class LoginCell: BaseCell {
    
    weak var delegate: LoginControllerDelegate?
    
    let logoImageView: UIImageView = {
        let image = UIImage(named: "logo")
        let iv = UIImageView(image: image)
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let emailTextField: PaddedTextField = {
        let tf = PaddedTextField()
        tf.padding = 10
        tf.placeholder = "Enter email"
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.layer.borderWidth = 1
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    let passwordTextField: PaddedTextField = {
        let tf = PaddedTextField()
        tf.placeholder = "Enter password"
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.layer.borderWidth = 1
        tf.isSecureTextEntry = true
        return tf
    }()
    
    lazy var loginButton: UIButton = {
        let b = UIButton()
        b.setTitle("Log in", for: .normal)
        b.backgroundColor = UIColor.orange
        b.setTitleColor(UIColor.white, for: .normal)
        b.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return b
    }()
    
    func handleLogin(){
        delegate?.finishLoggingIn()
    }
    
    override func setupView() {
        super.setupView()
        addSubview(logoImageView)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        
        _ = logoImageView.anchor(centerYAnchor, left: nil, bottom: nil, right: nil, topConstant: -200, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 160, heightConstant: 160)
        logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        _ = emailTextField.anchor(logoImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 32, bottomConstant: 0, rightConstant: -32, widthConstant: 0, heightConstant: 50)
        
        _ = passwordTextField.anchor(emailTextField.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 32, bottomConstant: 0, rightConstant: -32, widthConstant: 0, heightConstant: 50)
        
        _ = loginButton.anchor(passwordTextField.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 32, bottomConstant: 0, rightConstant: -32, widthConstant: 0, heightConstant: 50)
    }
}
