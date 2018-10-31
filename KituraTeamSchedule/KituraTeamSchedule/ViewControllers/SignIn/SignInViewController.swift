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
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    
    
    //MARK: - Actions
    @IBAction func signInActionHandler(_ sender: UIButton) {
        Navigation.changeRootVCTo(rootVCType: .TabBar)
    }
    
    //MARK: - VC LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set text feild delegates
        self.emailTexField.delegate = self
        self.passwordTextField.delegate = self
        
        //setupViews
        self.setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.registerForKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.removeObserver()
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
