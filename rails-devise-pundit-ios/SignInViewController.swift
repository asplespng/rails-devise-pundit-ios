//
//  SignInViewController.swift
//  rails-devise-pundit-ios
//
//  Created by Per Einar Evensen on 1/3/16.
//  Copyright © 2016 Per Einar Evensen. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import ObjectMapper
import AlamofireObjectMapper

class TokenResponse: Mappable {
    var token: String?
    var email: String?
    var userId: Int?

    required init?(_ map: Map){

    }

    func mapping(map: Map) {
        token <- map["token"]
        email <- map["email"]
        userId <- map["user_id"]
    }
}

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
        let spinner = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
        spinner.center = view.center
        view.addSubview(spinner)
        spinner.startAnimating()
        Alamofire.request(.POST, "http://localhost:3000/api/v1/sessions", headers: headers)
            .validate().responseObject() { (response: Response<TokenResponse, NSError>) in
                spinner.stopAnimating()
                switch response.result {
                case .Success:
                    if let tokenResponse = response.result.value {
                        print("token: \(tokenResponse.token!)")
                        print("email: \(tokenResponse.email!)")
                        print("id: \(tokenResponse.userId!)")
                        SharingManager.sharedInstance.token = tokenResponse.token!
                        SharingManager.sharedInstance.userId = tokenResponse.userId!
                    }
                case .Failure(let error):
                    print(error)
                    if ((response.response?.statusCode) != nil) {
                        print(NSHTTPURLResponse.localizedStringForStatusCode((response.response?.statusCode)!))
                    }
                    
                }
        }
        performSegueWithIdentifier("signInToHome", sender: sender)
    }
}
