//
// Created by Per Einar Evensen on 1/12/16.
// Copyright (c) 2016 Per Einar Evensen. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class User: NSObject {

    var id: Int?
    var email:String?

    required init?(json: JSON ) {
        super.init()
    }

    class func userByID(id:Int, completionHandler: (User) ->Void) {

    }

    class func endpointForID(id: Int) -> String {
        return "http://localhost:3000/api/v1/users/\(id)"
    }
}
