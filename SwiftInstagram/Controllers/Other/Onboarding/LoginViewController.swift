//
//  LoginViewController.swift
//  SwiftInstagram
//
//  Created by Mohammed Zaid Shaikh on 01/02/25.
//
import SafariServices
import UIKit

class LoginViewController: UIViewController {
    
    struct Constants{
        static let cornerRadius: CGFloat = 8.0
    }
    
    private let userNameEmailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Username or Email"
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.placeholder = "Password"
        field.returnKeyType = .continue
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.isSecureTextEntry = true
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal )
        return button
    }()
    
    private let termsCheckbox: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "checkbox_unchecked"), for: .normal)
        button.setImage(UIImage(named: "checkbox_checked"), for: .selected)
        button.setTitle(" I agree to the Terms & Conditions", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.contentHorizontalAlignment = .left
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = .black
        return button
    }()
    
    private let termsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Terms of Service", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    private let privacyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Privacy Policy", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    private let createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.setTitle("New User? Create an Account", for: .normal)
        return button
    }()
    
    private let headerView: UIView = {
        let header = UIView()
        header.clipsToBounds = true
        let backgroundImageView = UIImageView(image: UIImage(named: "gradient"))
        header.addSubview(backgroundImageView)
        return header
    }()
    private let togglePasswordButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        button.tintColor = .secondaryLabel
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        termsCheckbox.addTarget(self, action: #selector(didTapCheckbox), for: .touchUpInside)
        loginButton.addTarget(
            self,action: #selector(didTapLoginButton),for: .touchUpInside
        )
        createAccountButton.addTarget(
            self, action: #selector(didTapCreateAccountButton), for: .touchUpInside
        )
        termsButton.addTarget(
            self, action: #selector(didTapTermsButton), for: .touchUpInside
        )
        privacyButton.addTarget(
            self, action: #selector(didTapPrivacyButton), for: .touchUpInside
        )
        togglePasswordButton.addTarget(self, action: #selector(didTapTogglePasswordButton), for: .touchUpInside)
        
        userNameEmailField.delegate = self
        passwordField.delegate = self
        // Add the toggle password button to the password field
        passwordField.rightView = togglePasswordButton
        passwordField.rightViewMode = .always
        
        addSubViews()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        headerView.frame = CGRect(
            x: 0,
            y: 0.0,
            width: view.width,
            height: view.height/3.0
        )
        userNameEmailField.frame = CGRect(
            x: 25,
            y: headerView.bottom + 40,
            width: view.width - 50,
            height: 52
        )
        passwordField.frame = CGRect(
            x: 25,
            y: userNameEmailField.bottom + 10,
            width: view.width - 50,
            height: 52
        )
        
        termsCheckbox.frame = CGRect(
            x: 25,
            y: passwordField.bottom + 10,
            width: view.width - 50,
            height: 30
        )
        loginButton.frame = CGRect(
            x: 25,
            y: termsCheckbox.bottom + 10,
            width: view.width - 50,
            height: 52
        )
        createAccountButton.frame = CGRect(
            x: 25,
            y: loginButton.bottom + 10,
            width: view.width - 50,
            height: 52
        )
        termsButton.frame = CGRect(
            x: 10,
            y: view.height - view.safeAreaInsets.bottom - 100,
            width: view.width - 20,
            height: 50
        )
        privacyButton.frame = CGRect(
            x: 10,
            y: view.height - view.safeAreaInsets.bottom - 50,
            width: view.width - 20,
            height: 50
        )
        
        
        configureHeaderView()
    }
    
    private func configureHeaderView() {
        guard headerView.subviews.count == 1 else { return }
        guard let backgroundView = headerView.subviews.first as? UIImageView else { return }
        backgroundView.frame = headerView.bounds
        
        // Add Instagram Logo
        let imageView = UIImageView(image: UIImage(named: "text"))
        headerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(
            x: (headerView.width - headerView.width / 2.0) / 2.0, // Centered
            y: view.safeAreaInsets.top + 10,
            width: headerView.width / 2.0,
            height: headerView.height * 0.5 // Adjust height dynamically
        )
        
        // Add Welcome Label
        let welcomeLabel = UILabel()
        welcomeLabel.text = "Meet new people and socialize"
        welcomeLabel.textAlignment = .center
        welcomeLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        welcomeLabel.textColor = .white
        welcomeLabel.numberOfLines = 1
        welcomeLabel.backgroundColor = .clear
        
        headerView.addSubview(welcomeLabel)
        welcomeLabel.frame = CGRect(
            x: 0,
            y: imageView.frame.maxY + 10,
            width: headerView.width,
            height: 20
        )
        
        welcomeLabel.center.x = headerView.center.x // Ensure it's centered
        
        headerView.clipsToBounds = false // Allow label to be visible
    }
    
    
    private func addSubViews() {
        view.addSubview(headerView)
        view.addSubview(userNameEmailField)
        view.addSubview(passwordField)
        view.addSubview(termsCheckbox)
        view.addSubview(loginButton)
        view.addSubview(createAccountButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
    }
    
    @objc private func didTapLoginButton() {
        passwordField.resignFirstResponder()
        userNameEmailField.resignFirstResponder()
        
        guard let usernameEmail = userNameEmailField.text, !usernameEmail.isEmpty,
              let password = passwordField.text, !password.isEmpty, password.count >= 8 else {
            return
        }
        
        var userName: String?
        var email: String?
        //Login Functionality
        if usernameEmail.contains("@"), usernameEmail.contains("."){
            //email
            email = usernameEmail
        }
        else {
            //username
            userName = usernameEmail
        }
        
        AuthManager.shared.loginUser(username: userName, email: email, password: password){ success in
            DispatchQueue.main.async {
                if success {
                    //user logged in
                    self.dismiss(animated: true, completion: nil)
                }
                else {
                    //error occured
                    let alert = UIAlertController(title: "Log In Error", message: "Invalid username or password", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                    self.present(alert, animated: true)
                }
            }
        }
        
    }
    
    @objc private func didTapTermsButton() {
        guard let url = URL(string: "https://help.instagram.com/581066165581870") else { return }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    @objc private func didTapPrivacyButton() {
        guard let url = URL(string: "https://help.instagram.com/155833707900388") else { return }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    @objc private func didTapCreateAccountButton() {
        let vc = RegistrationViewController()
        vc.title = "Create Account"
        present(UINavigationController(rootViewController: vc), animated: true)
    }
    
    @objc private func didTapCheckbox() {
        termsCheckbox.isSelected.toggle()
    }
    
    @objc private func didTapTogglePasswordButton() {
        passwordField.isSecureTextEntry.toggle()
        let imageName = passwordField.isSecureTextEntry ? "eye.fill" : "eye.slash.fill"
        togglePasswordButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameEmailField {
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField{
            didTapLoginButton()
        }
        return true
    }
}
