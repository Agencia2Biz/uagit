//
//  PullRequestPresenter.swift
//  uagit
//
//  Created by Nicolau Atala Pelluzi on 31/01/18.
//  Copyright © 2018 nicolauatala. All rights reserved.
//

import Foundation
import Alamofire
import Localize_Swift

protocol PullRequestView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func showRepositoriesList()
    func showMessage(_ title: String, _ message: String)
}

class PullRequestPresenter {
    
    weak fileprivate var pullRequestView: PullRequestView?
    var getPullRequestRequest: Request?
    var repositorySelected: Repository?
    var pullRequestList: [PullRequest] = []
    
    func attachView(_ view: PullRequestView){
        pullRequestView = view
    }
    
    func detachView() {
        pullRequestView = nil
    }

    func getPullRequestList(){
        getPullRequestRequest?.cancel()
        self.pullRequestView?.startLoading()
        
        guard let repositorySelected = repositorySelected else {
            self.pullRequestView?.finishLoading()
            self.pullRequestView?.showMessage("TITLE_ERROR".localized(), "MESSAGE_WRONG".localized())
            return
        }
        
        getPullRequestRequest = APIManager.getPullRequest(owner: repositorySelected.owner.login!, repositoryName: repositorySelected.name!, success: {[weak self] (pullRequests) in
            self?.pullRequestView?.finishLoading()
            
            if let strongSelf = self{
                self?.pullRequestView?.finishLoading()
                if pullRequests.count > 0 {
                    strongSelf.pullRequestList.append(contentsOf: pullRequests)
                    self?.pullRequestView?.showRepositoriesList()
                } else {
                    self?.pullRequestView?.showMessage("ATTENTION".localized(), "NO_PULL_REQUEST".localized())
                }
            }
            
        }) { (error) in
            self.pullRequestView?.finishLoading()
            self.pullRequestView?.showMessage("TITLE_ERROR".localized(), "MESSAGE_WRONG".localized())
        }
    }
    
    deinit {
        getPullRequestRequest?.cancel()
    }
}
