//
//  PullRequestCell.swift
//  DesafioiOSConcrete
//
//  Created by Vinícius  Gontijo on 22/01/2018.
//  Copyright © 2018 Vinícius  Gontijo. All rights reserved.
//

import UIKit
import Kingfisher

class PullRequestCell: UITableViewCell {
    
    @IBOutlet weak var content: UIView!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var userphoto: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var buttonGoToGithub: UIButton!
    
    var pullRequest: PullRequest?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        shadowView.boxShadow()
        content.layer.cornerRadius = 9
        content.layer.masksToBounds = true
        shadowView.layer.cornerRadius = 9
        buttonGoToGithub.layer.cornerRadius = 9
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        userphoto.layoutIfNeeded()
        userphoto.rounded()
    }
    
    func populate(pullRequest: PullRequest){
        
        self.pullRequest = pullRequest
        
        if let pullRequestTitle = pullRequest.name{
            title.text = pullRequestTitle
        }
        
        if let pullRequestBody = pullRequest.description{
            body.text = pullRequestBody
        }
        
        if let pullRequestDate = pullRequest.date{
            date.text = pullRequestDate.dateToString()
        }
        
        if let userAvatar = pullRequest.user.photoURLDescription{
            userphoto.kf.setImage(with: userAvatar)
        }
        
        if let userLogin = pullRequest.user.login{
            username.text = userLogin
        }
    }
    
    @IBAction func goToGithub(_ sender: Any) {
        if let htmlURL = pullRequest?.urlPage{
            UIApplication.shared.openURL(URL(string: htmlURL)!)
        }
    }
    
    
}
