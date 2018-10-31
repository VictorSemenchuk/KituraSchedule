//
//  SignInViewController.swift
//  KituraTeamSchedule
//
//  Created by Dmitriy Tarelkin on 30/10/18.
//  Copyright © 2018 KituraTeam. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var emailTexField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    
    
    //MARK: - Actions
    @IBAction func signInActionHandler(_ sender: UIButton) {
        
    }
    
    //MARK: - VC LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupViews()
    }
    
    func setupViews() {
        
        //barButtonItems
        let leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(dismissController))
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
        self.navigationItem.title = "Sign In"
    }

    
    @objc func dismissController() {
        self.dismiss(animated: true, completion: nil)
    }
}
