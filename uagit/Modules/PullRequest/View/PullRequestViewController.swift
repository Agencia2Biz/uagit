//
//  PullRequestViewController.swift
//  uagit
//
//  Created by Nicolau Atala Pelluzi on 31/01/18.
//  Copyright © 2018 nicolauatala. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher
import PKHUD

class PullRequestViewController: UIViewController {
    
    @IBOutlet weak var navigationBar: NavigationBar!
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate let pullRequestPresenter = PullRequestPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pullRequestPresenter.attachView(self)
        
        navigationBar.delegate = self
        navigationBar.leftImageView.image = #imageLiteral(resourceName: "left-arrow")
        
        navigationBar.titleLabel.text = pullRequestPresenter.repositorySelected?.name
        
        prepareTableView()
        
        pullRequestPresenter.getPullRequestList()
    }
    
    func prepareTableView(){
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140.0
        
        tableView.register(UINib(nibName: Constants.TableViewCell.pullRequest, bundle: nil), forCellReuseIdentifier: Constants.TableViewCell.pullRequest)
        
        tableView.tableFooterView = UIView()
    }
    
    func setRepositorySelected(repository: Repository){
        pullRequestPresenter.repositorySelected = repository
    }

}

extension PullRequestViewController: PullRequestView {
    func startLoading() {
        DispatchQueue.main.async {
            HUD.show(.rotatingImage((UIImage(named: "progress"))))
        }
    }
    
    func finishLoading() {
        PKHUD.sharedHUD.hide(afterDelay: 0.1)
    }
    
    func showRepositoriesList() {
        tableView.reloadData()
        tableView.animateCellTableView()
    }
    
    func showMessage(_ title: String, _ message: String) {
        let action = UIAlertAction(title: "OK".localized(), style: .default, handler: nil)
        UIAlertController.presentAlertInViewController(self, title: title, message: message, actions: [action], completion: nil)
    }
}

extension PullRequestViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pullRequestPresenter.pullRequestList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViewCell.pullRequest, for: indexPath) as! PullRequestCell
        
        cell.populate(pullRequest: (pullRequestPresenter.pullRequestList[indexPath.row]))
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        return cell
    }
    
    private func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}

extension PullRequestViewController: NavigationBarDelegate {
    func leftButtonTouchUpInside() {
        self.navigationController?.popViewController(animated: true)
    }
}
