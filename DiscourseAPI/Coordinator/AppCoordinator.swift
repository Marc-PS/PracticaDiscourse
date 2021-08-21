//
//  AppCoordinator.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 18/1/21.
//

import UIKit

class AppCoordinator: Coordinator {
    let sessionAPI = SessionAPI()
    
    lazy var remoteDataManager: DiscourseAPIRemoteDataManager = {
        let remoteDataManager = DiscourseAPIRemoteDataManagerImpl(session: sessionAPI)
        return remoteDataManager
    }()
    
    lazy var localDataManager: DiscourseAPILocalDataManager = {
        let localDataManager = DiscourseAPILocalDataManagerImpl()
        return localDataManager
    }()
    
    lazy var dataManager: DiscourseAPIDataManager = {
        let dataManager = DiscourseAPIDataManager(localDataManager: self.localDataManager, remoteDataManager: self.remoteDataManager)
        return dataManager
    }()
    
    
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
     
    }
    
    override func start() {
        let tabBarController = UITabBarController()
        
        let topicsNavigationController = UINavigationController()
        let topicsCoordinator = TopicsCoordinator(presenter: topicsNavigationController, topicsDataManager: dataManager, topicDetailDataManager: dataManager, addTopicDataManager: dataManager)
        addChildCoordinator(topicsCoordinator)
        topicsCoordinator.start()
        
        let categoriesNavigationController = UINavigationController()
        let categoriesCoordinator = CategoriesCoordinator(presenter: categoriesNavigationController, categoriesDataManager: dataManager)
        addChildCoordinator(categoriesCoordinator)
        categoriesCoordinator.start()
        
        let usersNavigationController = UINavigationController()
        let usersCoordinator = UsersCoordinator(presenter: usersNavigationController, usersDataManager: dataManager, userDataManager: dataManager)
        addChildCoordinator(usersCoordinator)
        usersCoordinator.start()
        
        tabBarController.tabBar.tintColor = .black
        
        tabBarController.viewControllers = [topicsNavigationController, categoriesNavigationController, usersNavigationController]
        tabBarController.tabBar.items?.first?.image = UIImage(systemName: "list.dash")
        tabBarController.tabBar.items?[1].image = UIImage(systemName: "tag")
        tabBarController.tabBar.items?[2].image = UIImage(systemName: "person.3.fill")
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
    
    override func finish() {}
}
