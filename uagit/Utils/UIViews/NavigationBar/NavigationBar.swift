//
//  NavigationBar.swift
//  uagit
//
//  Created by Nicolau Atala Pelluzi on 27/01/18.
//  Copyright © 2018 nicolauatala. All rights reserved.
//

import UIKit

protocol NavigationBarDelegate: NSObjectProtocol {
    func leftButtonTouchUpInside()
    func rightButtonTouchUpInside()
}

extension NavigationBarDelegate {
    func leftButtonTouchUpInside() {}
    func rightButtonTouchUpInside() {}
}

class NavigationBar: UIView {
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    
    weak var delegate: NavigationBarDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        Bundle.main.loadNibNamed("NavigationBar", owner: self, options: nil)
        self.addSubview(view)
        view.frame = self.bounds
    }
    
    @IBAction func leftButtonTouchUpInside(_ sender: Any) {
        delegate?.leftButtonTouchUpInside()
    }
    
    @IBAction func rightButtonTouchUpInside(_ sender: Any) {
        delegate?.rightButtonTouchUpInside()
    }
    
}
