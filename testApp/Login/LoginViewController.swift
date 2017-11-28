//
//  LoginViewController.swift
//  testApp
//
//  Created by Владислав on 22.11.2017.
//  Copyright © 2017 Владислав. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class LoginViewController: UIViewController {
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func LoginButton(_ sender: Any) {
        
        if self.emailText.text == "" || self.passwordText.text == "" {
            
            var alertController = UIAlertController(title: "Error", message: "Please enter an email nad password", preferredStyle: .alert)
            var alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alertController.addAction(alertAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            
            Auth.auth().signIn(withEmail: self.emailText.text!, password: self.passwordText.text!, completion: { (user, error) in
                
                if error == nil {
                    print("You have successfully logged in")
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "navigationMenu")
                    self.present(vc!, animated: true, completion: nil)
                    
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            })
            
        }
        
    }
    

}
