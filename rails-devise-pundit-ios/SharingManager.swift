//
// Created by Per Einar Evensen on 1/9/16.
// Copyright (c) 2016 Per Einar Evensen. All rights reserved.
//

import Foundation

class SharingManager {
    var token: String?
    var email: String?
    var userId: Int?
    static let sharedInstance = SharingManager()
}
