//
//  APIManager.swift
//  uagit
//
//  Created by Nicolau Atala Pelluzi on 30/01/18.
//  Copyright © 2018 nicolauatala. All rights reserved.
//

import Foundation
import Alamofire

struct APIManager {
    #if PRODUCTION
        static let baseURL = "https://api.github.com"
    #else
    // TODO: change the url of development
        static let baseURL = "https://api.github.com"
    #endif
}
