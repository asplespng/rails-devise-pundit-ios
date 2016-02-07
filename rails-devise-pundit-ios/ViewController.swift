//
//  ViewController.swift
//  rails-devise-pundit-ios
//
//  Created by Per Einar Evensen on 1/3/16.
//  Copyright © 2016 Per Einar Evensen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("shared token: \(SharingManager.sharedInstance.token)")

        User.userByID(1, completionHandler: { (response) in
            response
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

