//
//  ReposViewController.swift
//  HubStoreApp
//
//  Created by Abdelrahman Sobhy on 6/16/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class ReposViewController: UIViewController {
    
    @IBOutlet weak private var reposTableView: UITableView!
    @IBOutlet weak private var noReposLbl: UILabel!
    @IBOutlet weak private var indecatorView: NVActivityIndicatorView!
    private var reopsViewControllerPresenter : ReopsViewControllerPresenter?
    override func viewDidLoad() {
        super.viewDidLoad()
        reopsViewControllerPresenter = ReopsViewControllerPresenterImpl(view: self)
        
        reopsViewControllerPresenter?.getRepos({ [weak self] repos in
            if !repos.isEmpty{
                self?.reposTableView.reloadData()
            } else {
                self?.noReposLbl.isHidden = false
            }
        })
    }
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
extension ReposViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reopsViewControllerPresenter?.reposCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RepoTableViewCell", for: indexPath) as? RepoTableViewCell else {return UITableViewCell()}
        reopsViewControllerPresenter?.configure(cell: cell, row: indexPath.row)
        return cell
    }
    
}

extension ReposViewController : UITableViewDelegate {
    
}

extension ReposViewController : ReopsViewControllerView {
    func showAlert(title : String , message : String) {
        let alert = UIAlertController(title: title , message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            self.dismiss(animated: true, completion: nil)}
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    func startLoadingIndicator() {
        indecatorView.startAnimating()

    }
    func stopLoadingIndicator() {
        indecatorView.stopAnimating()
    }
    
}

