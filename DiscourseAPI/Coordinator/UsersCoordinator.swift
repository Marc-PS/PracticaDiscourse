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
    //let userDetailDataManager: UserDetailDataManager
    
    init(presenter: UINavigationController, usersDataManager: UsersDataManager) {
        
        self.presenter = presenter
        self.usersDataManager = usersDataManager
       //self.topicDetailDataManager = topicDetailDataManager
    }
    
    override func start() {
        let usersViewModel = UsersViewModel(usersDataManager: self.usersDataManager)
        usersViewModel.coordinatorDelegate = self
        let usersViewController = UsersViewController(viewModel: usersViewModel)
        usersViewController.title = NSLocalizedString("Users", comment: "")
        usersViewModel.viewDelegate = usersViewController
        presenter.pushViewController(usersViewController, animated: true)
    }
    
    override func finish() {}
}

extension UsersCoordinator: UsersCoordinatorDelegate {
    func didSelect(user: User) {
        //TOD
//
//        self.topicDetailDataManager
//        let topicsDetailViewController = TopicsDet
//
//        presenter.pushViewController(topicDetailViewController, animated: false)
        
    }
    
}

//extension UsersCoordinator: UserDetailCoordinatorDelegate {
//    func topicDetailBackButtonTapped() {
//        presenter.popViewController(animated: true)
//    }
//}
