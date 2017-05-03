//
//  LoginViewController.swift
//  SlideThru Msg
//
//  Created by Anthony Taylor on 4/29/17.
//  Copyright © 2017 Taylor Theory Inc. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    //Mark: Properties
    
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBOutlet weak var tblUserList: UITableView!
    
    let data = [[String: AnyObject]]()
    var users = [[String: AnyObject]]()
    var nickname: String!
    var password: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "home") {
            
            let controller = segue.destination as! ViewController
            // let controller = UsersViewController()
            self.present(controller, animated: true, completion: nil)
            
            //Configure controller attributes.
        }
    }*/

    @IBAction func signinTapped(_ sender: UIButton) {
        //Authentication code
        let username:NSString = usernameTextfield.text! as NSString
        let password:NSString = passwordTextfield.text! as NSString
        
        if(username.isEqual(to: "") || password.isEqual(to: "")){
            let alertView:UIAlertController = UIAlertController(title: "Sign in Failed", message: "Please enter Username and Password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertView.addAction(defaultAction)
            present(alertView, animated: true, completion: nil)
        } else {
            do {
            self.nickname = usernameTextfield.text
            self.password = passwordTextfield.text
            
            SocketIOManager.sharedInstance.connectToServerWithNickname(self.nickname, password: self.password, completionHandler: { (userList) -> Void in
                DispatchQueue.main.async(execute: { () -> Void in
                    if userList != nil {
                        self.users = userList!
                        print(userList!)
                        
                        let userLoggedin = self.storyboard?.instantiateViewController(withIdentifier: "TableViewController") as! TableViewController
                        userLoggedin.data = userList!
                        self.present(userLoggedin, animated: true, completion: nil)
                        
                     //self.performSegue(withIdentifier: "home", sender: nil)
                        //self.performSegue(withIdentifier: "home", sender: nil)
                        
                    }
                })
            })
          } //end do
        } //end else
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
