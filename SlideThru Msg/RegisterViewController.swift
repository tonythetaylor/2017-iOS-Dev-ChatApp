//
//  RegisterViewController.swift
//  SlideThru Msg
//
//  Created by Anthony Taylor on 5/2/17.
//  Copyright © 2017 Taylor Theory Inc. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var firstNameTextfield: UITextField!
    @IBOutlet weak var lastNameTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var userNameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    var usersReg = [[String: AnyObject]]()
    
    var firstname: String!
    var lastname: String!
    var email: String!
    var username: String!
    var password: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerBtnTapped(_ sender: UIButton) {
        
        //Register code
        let firstname:NSString = firstNameTextfield.text! as NSString
        let lastname:NSString = lastNameTextfield.text! as NSString
        let email:NSString = emailTextfield.text! as NSString
        let username:NSString = userNameTextfield.text! as NSString
        let password:NSString = passwordTextfield.text! as NSString
        
        if(firstname.isEqual(to: "") || lastname.isEqual(to: "") || email.isEqual(to: "") || username.isEqual(to: "") || password.isEqual(to: "")){
            let alertView:UIAlertController = UIAlertController(title: "Register to use", message: "Please enter Username and Password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertView.addAction(defaultAction)
            present(alertView, animated: true, completion: nil)
        } else {
            do {
                self.firstname = firstNameTextfield.text
                self.lastname = lastNameTextfield.text
                self.email = emailTextfield.text
                self.username = userNameTextfield.text
                self.password = passwordTextfield.text
                
                SocketIOManager.sharedInstance.connectToRegisterUser(self.firstname, lastname: self.lastname, email: self.email, username: self.username, password: self.password, completionHandler: { (userRegisterList) -> Void in
                    DispatchQueue.main.async(execute: { () -> Void in
                        if userRegisterList != nil {
                            self.usersReg = userRegisterList!
                            print(userRegisterList!)
                            
                            self.performSegue(withIdentifier: "login", sender: nil)
                            
                        }
                    })
                })
            }
            
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
