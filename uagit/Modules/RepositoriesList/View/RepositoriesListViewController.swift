//
//  RepositoriesListViewController.swift
//  uagit
//
//  Created by Nicolau Atala Pelluzi on 29/01/18.
//  Copyright © 2018 nicolauatala. All rights reserved.
//

import UIKit
import Alamofire
import PKHUD

class RepositoriesListViewController: UIViewController {
    
    @IBOutlet weak var navigationBar: NavigationBar!
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate let repositoryPresenter = RepositoryPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        repositoryPresenter.attachView(self)
        
        navigationBar.delegate = self
        navigationBar.titleLabel.text = Constants.NavigationBarTitle.java
        
        prepareTableView()
        
        repositoryPresenter.getRepositoryList()
    }
    
    func prepareTableView(){
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50
        tableView.register(UINib(nibName: Constants.TableViewCell.repository, bundle: nil), forCellReuseIdentifier: Constants.TableViewCell.repository)
        tableView.tableFooterView = UIView()
    }
    
}

extension RepositoriesListViewController: RepositoryView {
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
        if repositoryPresenter.page == 1 {
            tableView.animateCellTableView()
        }
    }
    
    func showMessage(_ title: String, _ message: String) {
        let action = UIAlertAction(title: "OK".localized(), style: .default, handler: nil)
        UIAlertController.presentAlertInViewController(self, title: title, message: message, actions: [action], completion: nil)
    }
    
    
}

extension RepositoriesListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.repositoryPresenter.repositoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViewCell.repository, for: indexPath) as! RepositoryTableViewCell
        
        cell.populate(with: self.repositoryPresenter.repositoryList[indexPath.row])
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        return cell
    }
    
    private func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let last = self.repositoryPresenter.repositoryList.count - 1

        if indexPath.row == last {
            self.repositoryPresenter.page += 1
            self.repositoryPresenter.getRepositoryList()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toListPullRequestSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toListPullRequestSegue"{
            let destinationVC = segue.destination as! PullRequestViewController
            destinationVC.setRepositorySelected(repository: self.repositoryPresenter.repositoryList[(tableView.indexPathForSelectedRow?.row)!])
        }
    }
    
}

extension RepositoriesListViewController: NavigationBarDelegate {
    
}
