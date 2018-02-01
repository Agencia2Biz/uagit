//
//  UIImage+Icons.swift
//  uagit
//
//  Created by Nicolau Atala Pelluzi on 25/01/18.
//  Copyright © 2018 nicolauatala. All rights reserved.
//

import UIKit

extension UIImageView{
    
    func rounded() {
        self.layer.cornerRadius = self.frame.height / 2
    }
}
