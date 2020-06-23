//
//  EnterUserViewController.swift
//  HubStoreApp
//
//  Created by Abdelrahman Sobhy on 6/20/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import UIKit

class EnterUserViewController: UIViewController {
    @IBOutlet weak private var userNameTF: UITextField!
    var enterUserViewControllerPresenter : EnterUserViewControllerPresenter?
    override func viewDidLoad() {
        super.viewDidLoad()
        enterUserViewControllerPresenter = EnterUserViewControllerPresenterImpl(view: self)

    }
    @IBAction private func showReposBtnWasPressed(_ sender: Any) {
        guard let userName = userNameTF.text else {return}

        enterUserViewControllerPresenter?.getUserName(userName: userName)
    }
    
}

extension EnterUserViewController : EnterUserViewControllerView {
    func navigateToRepos() {
        guard let reposView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ReposViewController") as? ReposViewController else {return}
        reposView.modalPresentationStyle = .fullScreen
        present(reposView , animated: true,completion: nil )
    }
  
}
