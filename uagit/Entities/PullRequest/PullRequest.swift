//
//  PullRequest.swift
//  uagit
//
//  Created by Nicolau Atala Pelluzi on 25/01/18.
//  Copyright © 2018 nicolauatala. All rights reserved.
//

import Foundation
import ObjectMapper

class PullRequest: Mappable {
    
    var name: String?
    var description: String?
    var date: Date?
    var urlPage: String?
    var user = Owner()
    
    init() {}
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        name <- map["title"]
        description <- map["body"]
        urlPage <- map["html_url"]
        
        if let date = map["created_at"].currentValue as? String{
            self.date = date.getDateWithString()
        }
        
        user.login <- map["user.login"]
        user.avatar_url <- map["user.avatar_url"]
    }
    
    
}
