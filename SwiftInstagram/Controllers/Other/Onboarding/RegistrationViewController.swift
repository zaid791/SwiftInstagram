//
//  RegistrationViewController.swift
//  SwiftInstagram
//
//  Created by Mohammed Zaid Shaikh on 01/02/25.
//

import UIKit

class RegistrationViewController: UIViewController {
    struct Constants {
        static let cornerRadius: CGFloat = 8.0
    }
    
    private let usernameField: UITextField = {
        let field = UITextField()
        field.placeholder = "First Name"
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
    private let lastNameField: UITextField = {
        let field = UITextField()
        field.placeholder = "Last Name"
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
    
    private let emailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Email Address"
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
    private let confirmPasswordField: UITextField = {
        let field = UITextField()
        field.placeholder = "Confirm Password"
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
    
    private let mobileNumberField: UITextField = {
        let field = UITextField()
        field.placeholder = "Mobile Number"
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.keyboardType = .phonePad
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let genderField: UITextField = {
        let field = UITextField()
        field.placeholder = "Gender"
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
    
    private let birthdateField: UITextField = {
        let field = UITextField()
        field.placeholder = "Birthdate (MM/DD/YYYY)"
        field.returnKeyType = .done
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
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .wheels
        picker.maximumDate = Date() // Restrict future dates
        return picker
    }()
    
    private let togglePasswordButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        button.tintColor = .secondaryLabel
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        return button
    }()
    private let toggleConfirmPasswordButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        button.tintColor = .secondaryLabel
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(usernameField)
        view.addSubview(lastNameField)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(confirmPasswordField)
        view.addSubview(mobileNumberField)
        view.addSubview(genderField)
        view.addSubview(birthdateField)
        view.addSubview(registerButton)
        view.addSubview(termsCheckbox)
        view.backgroundColor = .systemBackground
        togglePasswordButton.addTarget(self, action: #selector(didTapTogglePasswordButton(_:)), for: .touchUpInside)
        toggleConfirmPasswordButton.addTarget(self, action: #selector(didTapTogglePasswordButton(_:)), for: .touchUpInside)
        // Add the toggle password button to the password field
        passwordField.rightView = togglePasswordButton
        passwordField.rightViewMode = .always
        confirmPasswordField.rightView = toggleConfirmPasswordButton
        confirmPasswordField.rightViewMode = .always
        // Set up the date picker for the birthdate field
        setupDatePicker()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let fieldHeight: CGFloat = 52
        let spacing: CGFloat = 10
        
        usernameField.frame = CGRect(x: 20, y: view.safeAreaInsets.top + 50, width: view.width - 40, height: fieldHeight)
        lastNameField.frame = CGRect(x: 20, y: usernameField.bottom + spacing, width: view.width - 40, height: fieldHeight)
        emailField.frame = CGRect(x: 20, y: lastNameField.bottom + spacing, width: view.width - 40, height: fieldHeight)
        passwordField.frame = CGRect(x: 20, y: emailField.bottom + spacing, width: view.width - 40, height: fieldHeight)
        confirmPasswordField.frame = CGRect(x: 20, y: passwordField.bottom + spacing, width: view.width - 40, height: fieldHeight)
        mobileNumberField.frame = CGRect(x: 20, y: confirmPasswordField.bottom + spacing, width: view.width - 40, height: fieldHeight)
        genderField.frame = CGRect(x: 20, y: mobileNumberField.bottom + spacing, width: view.width - 40, height: fieldHeight)
        birthdateField.frame = CGRect(x: 20, y: genderField.bottom + spacing, width: view.width - 40, height: fieldHeight)
        registerButton.frame = CGRect(x: 20, y: birthdateField.bottom + spacing, width: view.width - 40, height: fieldHeight)
        
    }
    
    private func setupDatePicker() {
        // Create a toolbar with a "Done" button
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didTapDoneButton))
        toolbar.setItems([doneButton], animated: true)
        
        // Assign the date picker and toolbar to the birthdate field
        birthdateField.inputView = datePicker
        birthdateField.inputAccessoryView = toolbar
    }
    
    @objc private func didTapDoneButton() {
        // Format the selected date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        birthdateField.text = dateFormatter.string(from: datePicker.date)
        
        // Dismiss the date picker
        birthdateField.resignFirstResponder()
    }
    
    @objc private func didTapTogglePasswordButton(_ sender: UIButton) {
        if sender == togglePasswordButton {
            passwordField.isSecureTextEntry.toggle()
            let imageName = passwordField.isSecureTextEntry ? "eye.fill" : "eye.slash.fill"
            togglePasswordButton.setImage(UIImage(systemName: imageName), for: .normal)
        } else if sender == toggleConfirmPasswordButton {
            confirmPasswordField.isSecureTextEntry.toggle()
            let imageName = confirmPasswordField.isSecureTextEntry ? "eye.fill" : "eye.slash.fill"
            toggleConfirmPasswordButton.setImage(UIImage(systemName: imageName), for: .normal)
        }
    }
}
