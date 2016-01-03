//
//  SignInViewController.swift
//  rails-devise-pundit-ios
//
//  Created by Per Einar Evensen on 1/3/16.
//  Copyright © 2016 Per Einar Evensen. All rights reserved.
//

import UIKit
import Alamofire

class SignInViewController: UIViewController {

    // MARK: Properties
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func signIn(sender: AnyObject) {
        let userPasswordString = "\(emailTextField.text!):\(passwordTextField.text!)"
        let userPasswordData = userPasswordString.dataUsingEncoding(NSUTF8StringEncoding)!
        let base64EncodedCredential = userPasswordData.base64EncodedStringWithOptions([])
        let headers = [
            "Authorization": "Basic \(base64EncodedCredential)"]
        Alamofire.request(.POST, "http://localhost:3000/api/v1/sessions", headers: headers)
            .responseJSON { response in
                debugPrint(response)
        }
        performSegueWithIdentifier("signInToHome", sender: sender)
    }
}
