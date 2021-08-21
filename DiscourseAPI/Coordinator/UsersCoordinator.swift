//
//  UsersCoordinator.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 18/1/21.
//

import UIKit

class UsersCoordinator: Coordinator {
    let presenter: UINavigationController
    let usersDataManager: UsersDataManager
    let userDataManager: UserDataManager
    
    init(presenter: UINavigationController, usersDataManager: UsersDataManager, userDataManager: UserDataManager) {
        
        self.presenter = presenter
        self.usersDataManager = usersDataManager
        self.userDataManager = userDataManager
    }
    
    override func start() {
        let usersViewModel = UsersViewModel(usersDataManager: usersDataManager)
        let usersViewController = UsersViewController(usersViewModel: usersViewModel)
        usersViewModel.viewDelegate = usersViewController
        usersViewModel.coordinatorDelegate = self
        usersViewController.title = NSLocalizedString("Users", comment: "")
        presenter.pushViewController(usersViewController, animated: false)
    }
    
    override func finish() {}
}

extension UsersCoordinator: UsersViewModelCoordinatorDelegate {
    func didSelect(username: String) {
        let userViewModel = UserViewModel(username: username, userDataManager: userDataManager)
        let usersViewModel = UsersViewModel(usersDataManager: usersDataManager)
        let usersViewController = UsersViewController(usersViewModel: usersViewModel)
        let userViewController = UserViewController(viewModel: userViewModel, prueba: usersViewController)
        userViewModel.viewDelegate = userViewController
        userViewController.title = NSLocalizedString(username, comment: "")
        presenter.pushViewController(userViewController, animated: true)
    }
}

