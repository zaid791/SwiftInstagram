//
//  ViewController.swift
//  SwiftInstagram
//
//  Created by Mohammed Zaid Shaikh on 31/01/25.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let loginVC = LoginViewController()
        loginVC.modalPresentationStyle = .fullScreen
        present(loginVC, animated: false)
//        navigationController?.pushViewController(loginVC, animated: true)
    }

}

