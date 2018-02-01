//
//  RepositoriesPresenter.swift
//  uagit
//
//  Created by Nicolau Atala Pelluzi on 27/01/18.
//  Copyright © 2018 nicolauatala. All rights reserved.
//

import Foundation
import Alamofire
import Localize_Swift

struct RepositoryViewData {
    let name: String
    let description: String
    let forks: String
    let stargazers: String
    let ownerLogin: String
}

protocol RepositoryView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func showRepositoriesList()
    func showMessage(_ title: String, _ message: String)
}

class RepositoryPresenter {

    weak fileprivate var repositoryView: RepositoryView?
    
    var page: Int = 1
    var getRepositoriesRequest: Request?
    var repositoryList = [Repository]()
    
    func attachView(_ view: RepositoryView){
        repositoryView = view
    }
    
    func detachView() {
        repositoryView = nil
    }
    
    func getRepositoryList(){
        getRepositoriesRequest?.cancel()
        self.repositoryView?.startLoading()
        
        getRepositoriesRequest = APIManager.getRepositories(type: "stars", page: page, success: {[weak self] (repositories) in
            self?.repositoryView?.finishLoading()
            
            if let strongSelf = self {
                strongSelf.repositoryList.append(contentsOf: repositories)
                self?.repositoryView?.showRepositoriesList()
                self?.repositoryView?.finishLoading()
            }
            
        }) { (error) in
            self.repositoryView?.finishLoading()
            self.repositoryView?.showMessage("TITLE_ERROR".localized(), "MESSAGE_WRONG".localized())
        }
    }
    
    deinit {
        getRepositoriesRequest?.cancel()
    }
}
