//
//  WelcomeViewController.swift
//  
//
//  Created by Dmitriy Tarelkin on 30/10/18.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var logoImageView: UIImageView!
    @IBOutlet var signInButton: UIButton!
    @IBOutlet var signUpButton: UIButton!
    
    //MARK: - Actions
    @IBAction func showSignInHandler(sender: UIButton) {
        
        let signIn = SignInViewController()
        let nav = UINavigationController(rootViewController: signIn)

        let buttonFrame = sender.frame
        UIView.animateButton(button: sender, duration: 0.2, additionalCompletion: nil) {
            self.present(nav, animated: true, completion: {
                self.returnButtonRepresentation(button: sender, frame: buttonFrame)
            })
        }
    }
    
    @IBAction func showSignUpActionHandler(sender: UIButton) {
        
        let signUp = SignUpViewController()
        let nav = UINavigationController(rootViewController: signUp)
        
        let buttonFrame = sender.frame
        UIView.animateButton(button: sender, duration: 0.2, additionalCompletion: nil) {
            self.present(nav, animated: true, completion: {
                self.returnButtonRepresentation(button: sender, frame: buttonFrame)
            })
        }
    }
    
    func returnButtonRepresentation(button: UIButton, frame: CGRect) {
        button.frame = frame
        button.alpha = 1
        button.layer.cornerRadius = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.view.alpha = 1
        }
    }
    
    func setupViews() {
    }
}
