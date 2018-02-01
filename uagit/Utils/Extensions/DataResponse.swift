//
//  DataResponse.swift
//  uagit
//
//  Created by Nicolau Atala Pelluzi on 25/01/18.
//  Copyright © 2018 nicolauatala. All rights reserved.
//

import Foundation
import Alamofire


extension DataResponse {
    
    var isSuccess: Bool {
        get {
            guard let statusCode = response?.statusCode else { return false }
            if 200 ... 299 ~= statusCode {
                return true
            } else {
                return false
            }
        }
    }
}
