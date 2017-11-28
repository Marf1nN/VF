//
//  CreateAccountViewController.swift
//  testApp
//
//  Created by Владислав on 22.11.2017.
//  Copyright © 2017 Владислав. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class CreateAccountViewController: UIViewController {
    @IBOutlet weak var createLoginText: UITextField!
    @IBOutlet weak var createPasswordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createAccountButton(_ sender: Any) {
        
        if createLoginText.text == "" {
            let alert = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            
            let defaultAlert = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(defaultAlert)
            
            present(alert, animated: true, completion: nil)
    
        } else {
            
            Auth.auth().createUser(withEmail: createLoginText.text!, password: createPasswordText.text!, completion: { (user, error) in
                if error == nil {
                        print("You have some problems")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "login")
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
