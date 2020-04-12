//
//  ViewController.swift
//  TLLoadingButtonExamples
//
//  Created by ThinhLe on 4/11/20.
//  Copyright © 2020 ThinhLe. All rights reserved.
//

import UIKit
import TLLoadingButton

class ViewController: UIViewController {
    @IBOutlet weak var signUpButton: TLLoadingButton!
    @IBOutlet weak var containerView: UIView!
    
    var signInButton: TLLoadingButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Init loading button programatically
        let frame = CGRect(x: 0, y: 0, width: 300, height: 40)
        signInButton = TLLoadingButton(frame: frame)
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        signInButton.setTitleColor(.red, for: .normal)
        signInButton.loadingTitle = "Processing..."
        signInButton.layer.borderColor = UIColor.red.cgColor
        signInButton.layer.borderWidth = 1
        signInButton.layer.cornerRadius = 20
        signInButton.spacing = 12
        containerView.addSubview(signInButton)
        
        // Calling after setting up everything
        signInButton.finishSetUp()
        
        // set up sign up button
        signUpButton.layer.borderColor = UIColor.red.cgColor
        signUpButton.layer.borderWidth = 1
        signUpButton.layer.cornerRadius = 20
        signUpButton.animatedStyle = .right
    }

    @IBAction func didTapSignUpButton(_ sender: Any) {
        signUpButton.startLoading()
        fetchData {
            self.signUpButton.stopLoading()
        }
    }
    
    @objc func signIn() {
        signInButton.startLoading()
        fetchData {
            self.signInButton.stopLoading()
        }
    }
    
    private func fetchData(completion: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion()
        }
    }
}

