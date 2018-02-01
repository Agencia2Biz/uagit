//
//  Collection.swift
//  uagit
//
//  Created by Nicolau Atala Pelluzi on 25/01/18.
//  Copyright © 2018 nicolauatala. All rights reserved.
//

import RealmSwift

extension Results {
    
    func toArray() -> [T] {
        var array = [T]()
        for result in self {
            array.append(result)
        }
        return array
    }
}
