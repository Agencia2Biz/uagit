//
//  UIView.swift
//  uagit
//
//  Created by Nicolau Atala Pelluzi on 25/01/18.
//  Copyright © 2018 nicolauatala. All rights reserved.
//

import UIKit

extension UIView {
    
    func superview<T>(ofType type: T.Type) -> T? where T: UIView {
        return superview as? T ?? superview?.superview(ofType: type)
    }
    
    func subviews<T>(ofType type: T.Type) -> [T] where T: UIView {
        var subviews: [T] = []
        for view in self.subviews {
            if let tView = view as? T {
                subviews.append(tView)
            }
            let viewSubviews = view.subviews(ofType: T.self)
            subviews = Array([subviews, viewSubviews].joined())
        }
        return subviews
    }
    
    func boxShadow(){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 1, height: 3)
        self.layer.shadowRadius = 2
    }
    
    @IBInspectable var roundedCircle: Bool {
        get {
            return self.layer.cornerRadius == self.frame.height / 2
        }
        set {
            if newValue == true {
                self.layer.cornerRadius = self.frame.height / 2
                
            } else {
                self.layer.cornerRadius = 0
            }
        }
    }
    
    
}
