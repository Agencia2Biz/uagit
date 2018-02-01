//
//  Date.swift
//  uagit
//
//  Created by Nicolau Atala Pelluzi on 31/01/18.
//  Copyright © 2018 nicolauatala. All rights reserved.
//

import Foundation

extension Date {
    func dateToString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: self)
    }
}
