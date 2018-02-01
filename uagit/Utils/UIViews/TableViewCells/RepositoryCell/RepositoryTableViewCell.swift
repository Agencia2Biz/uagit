//
//  RepositoryTableViewCell.swift
//  uagit
//
//  Created by Nicolau Atala Pelluzi on 29/01/18.
//  Copyright © 2018 nicolauatala. All rights reserved.
//

import UIKit
import Kingfisher

class RepositoryTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var content: UIView!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var repositorydescription: UILabel!
    @IBOutlet weak var forksCount: UILabel!
    @IBOutlet weak var starCount: UILabel!
    
    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var username: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        shadowView.boxShadow()
        content.layer.cornerRadius = 9
        content.layer.masksToBounds = true
        shadowView.layer.cornerRadius = 9
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        userPhoto.layoutIfNeeded()
        userPhoto.rounded()
    }
    
    func populate(with data: Repository){
        
        if let repName = data.name{
            name.text = repName
        }
        
        if let repDescription = data.description{
            repositorydescription.text = repDescription
        }
        
        if let repForks = data.forksCount{
            forksCount.text = String(repForks)
        }
        
        if let repStars = data.starsCount{
            starCount.text = String(repStars)
        }
        
        if let urlPhoto = data.owner.photoURLDescription{
            userPhoto.kf.setImage(with: urlPhoto)
        }
        
        if let repUsername = data.owner.login{
            username.text = repUsername
        }
    }
}
