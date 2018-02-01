//
//  Constants.swift
//  uagit
//
//  Created by Nicolau Atala Pelluzi on 25/01/18.
//  Copyright © 2018 nicolauatala. All rights reserved.
//

import Foundation
import Alamofire

enum Constants {
    
    enum errorCode: Int {
        case nonRetryCode = 0
        case retryCode = 1
    }
    
    enum Storyboard {
        static let mainSearchStoryboard = "MainSearchStoryboard"
    }
    
    enum ViewControllerIdentifier {
        
    }
    
    enum TableViewCell {
        static let repository = "RepositoryTableViewCell"
        static let pullRequest = "PullRequestCell"
    }
    
    enum NavigationBarTitle {
        static let java = "Java"
    }
    
    enum Font {
        static let SFTextLight = "SanFranciscoText-Light"
        static let SFTextMedium = "SanFranciscoText-Medium"
        static let SFTextRegular = "SanFranciscoText-Regular"
    }

}
