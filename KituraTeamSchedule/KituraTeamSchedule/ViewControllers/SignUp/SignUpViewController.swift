//
//  SignUpViewController.swift
//  
//
//  Created by Dmitriy Tarelkin on 30/10/18.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    //MARK: - Actions
    
    @IBAction func doneActionHandler(_ sender: Any) {
        Navigation.changeRootVCTo(rootVCType: .TabBar)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //textField Delegates
        self.firstNameTextField.delegate = self
        self.lastNameTextField.delegate = self
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        
        //setup views
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
        self.navigationItem.title = "Sign Up"
    }
    
    
    @objc func dismissController() {
        self.dismiss(animated: true, completion: nil)
    }
}
