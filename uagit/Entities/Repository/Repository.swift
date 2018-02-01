//
//  Repository.swift
//  uagit
//
//  Created by Nicolau Atala Pelluzi on 25/01/18.
//  Copyright © 2018 nicolauatala. All rights reserved.
//

import Foundation
import ObjectMapper

class Repository: Mappable {
    
    var name: String?
    var description: String?
    var forksCount: Int?
    var starsCount: Int?
    var owner = Owner()
    
    init(name: String, description: String, forksCount: Int, starsCount: Int, owner: Owner) {
        self.name = name
        self.description = description
        self.forksCount = forksCount
        self.starsCount = starsCount
        self.owner = owner
    }
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        description <- map["description"]
        forksCount <- map["forks_count"]
        starsCount <- map["stargazers_count"]
        
        owner.login <- map["owner.login"]
        owner.avatar_url <- map["owner.avatar_url"]
    }
    
}
