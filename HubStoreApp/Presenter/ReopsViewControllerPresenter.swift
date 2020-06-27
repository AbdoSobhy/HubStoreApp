//
//  ReopsViewControllerPresenter.swift
//  HubStoreApp
//
//  Created by Abdelrahman Sobhy on 6/17/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import Foundation
protocol ReopsViewControllerView : AnyObject{
    func startLoadingIndicator()
    func stopLoadingIndicator()
    func showAlert(title : String , message : String)
}

protocol ReopsViewControllerPresenter {
    func configure(cell : RepoCellView , row : Int)
    func getRepos(_ completionHandeller : @escaping ([Repositorie]) -> Void)
    var reposCount : Int { get }
}

class ReopsViewControllerPresenterImpl : ReopsViewControllerPresenter {
    weak private var  view : ReopsViewControllerView?
    weak private var cellView : RepoCellView?
    
    init(view : ReopsViewControllerView) {
        self.view = view
    }
    var repos = [Repositorie]()
    
    var reposCount : Int {
        repos.count
    }
    
    func getRepos(_ completionHandeller : @escaping ([Repositorie]) -> Void) {
        view?.startLoadingIndicator()
        ApiRequest.fetchRepos { (reaponse : [Repositorie]? , err) in
            if let repos = reaponse {
                self.view?.stopLoadingIndicator()
                self.repos.append(contentsOf: repos)
                completionHandeller(repos)
            }
            else {
                self.view?.stopLoadingIndicator()
                self.view?.showAlert(title: "Wrong User!", message: "Please enter correct username")
            }
        }
    }
    
    /// Cell Configure
    func configure(cell : RepoCellView , row : Int) {
        cell.display(name: repos[row].name ?? " ")
        cell.display(description: repos[row].description ?? " ")
        // split string
        let date = repos[row].updated_at?.split(separator: "T")
        cell.display(date: String(date?[0] ?? "0000-00-00"))
        
    }
    
}
