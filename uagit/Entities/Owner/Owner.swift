//
//  Owner.swift
//  uagit
//
//  Created by Nicolau Atala Pelluzi on 25/01/18.
//  Copyright © 2018 nicolauatala. All rights reserved.
//

import Foundation

class Owner {
    
    var login: String?
    var avatar_url: String?
 
    var photoURLDescription: URL?{
        if let photo_url = avatar_url{
            return URL(string: photo_url)
        }
        return nil
    }
}
