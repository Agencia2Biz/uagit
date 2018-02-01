//
//  String.swift
//  uagit
//
//  Created by Nicolau Atala Pelluzi on 25/01/18.
//  Copyright © 2018 nicolauatala. All rights reserved.
//

import Foundation

extension String {
    
    var digits: String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted).joined(separator: ".")
    }
    
    var integer: Int {
        return Int(digits) ?? 0
    }
    
    var double: Double {
        return Double(digits) ?? 0.0
    }
    
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    
    func isEqualToString(find: String) -> Bool {
        return String(format: self) == find
    }
    
    func getDateWithString() -> Date? {
        let fomatter = DateFormatter()
        fomatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = fomatter.date(from: self)
        return date
    }
    
    mutating func replace(_ originalString:String, with newString:String) {
        self = self.replacingOccurrences(of: originalString, with: newString)
    }
    
}
