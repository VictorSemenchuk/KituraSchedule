//
//  SignUpViewController.swift
//  
//
//  Created by Dmitriy Tarelkin on 30/10/18.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var doneButton: UIButton!
    
    
    //MARK: - Actions
    
    @IBAction func doneActionHandler(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
        // Do any additional setup after loading the view.
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
