//
//  LoginViewController.swift
//  SwiftInstagram
//
//  Created by Mohammed Zaid Shaikh on 01/02/25.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let userNameEmailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Username or Email"
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.placeholder = "Password"
        field.isSecureTextEntry = true
        return field
    }()

    private let loginButton: UIButton = {
        return UIButton()
    }()
    
    private let termsButton: UIButton = {
        return UIButton()
    }()

    private let privacyButton: UIButton = {
        return UIButton()
    }()
    
    private let createAccountButton: UIButton = {
        return UIButton()
    }()
    
    private let headerView: UIView = {
        return UIView()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    private func addSubViews() {
        view.addSubview(headerView)
        view.addSubview(userNameEmailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(createAccountButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
    }
    
    @objc private func didTapLoginButton() {}
    
    @objc private func didTapTermsButton() {}
    
    @objc private func didTapPrivacyButton() {}
    
    @objc private func didTapCreateAccountButton() {}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
