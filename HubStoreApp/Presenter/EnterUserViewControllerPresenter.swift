//
//  EnterUserViewControllerPresenter.swift
//  HubStoreApp
//
//  Created by Abdelrahman Sobhy on 6/20/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import Foundation
protocol EnterUserViewControllerView : AnyObject {
    func navigateToRepos()
}
protocol EnterUserViewControllerPresenter {
    func getUserName(userName : String)
}
class EnterUserViewControllerPresenterImpl : EnterUserViewControllerPresenter {
    
    weak var view :  EnterUserViewControllerView?
    init(view : EnterUserViewControllerView) {
        self.view = view
    }
    
    func getUserName(userName : String) {
        let trimmedUserName = String(userName.filter { !" \n\t\r\'".contains($0) })
        ApiRouter.constent.userName = trimmedUserName
        view?.navigateToRepos()
    }
}
