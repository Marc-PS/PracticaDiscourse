//
//  TopicsCoordinator.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 18/1/21.
//

import UIKit

class TopicsCoordinator: Coordinator, TopicDetailCoordinatorDelegate {

    let presenter: UINavigationController
    let topicsDataManager: TopicsDataManager
    let topicDetailDataManager: TopicDetailDataManager
    let addTopicDataManager: AddTopicDataManager
    var topicsViewModel: TopicsViewModel?
    
    
    init(presenter: UINavigationController, topicsDataManager: TopicsDataManager,
         topicDetailDataManager: TopicDetailDataManager,
         addTopicDataManager: AddTopicDataManager) {
        
        self.presenter = presenter
        self.topicsDataManager = topicsDataManager
        self.topicDetailDataManager = topicDetailDataManager
        self.addTopicDataManager = addTopicDataManager
        
    }
    
    override func start() {
        let topicsViewModel = TopicsViewModel(topicsDataManager: self.topicsDataManager)
        let topicsViewController = TopicsViewController(viewModel: topicsViewModel)
        topicsViewController.title = NSLocalizedString("Topics", comment: "")
        topicsViewModel.topicsViewDelegate = topicsViewController
        topicsViewModel.coordinatorDelegate = self
        self.topicsViewModel = topicsViewModel
        presenter.pushViewController(topicsViewController, animated: true)
    }
    
    override func finish() {}
    
    func topicDetailBackButtonTapped() {
        self.presenter.popViewController(animated: true)
    }
}




extension TopicsCoordinator: TopicsCoordinatorDelegate {
    func didSelect(topic: Topic) {
        let detailViewModel = TopicDetailViewModel(topic: topic, topicDetailDataManager: self.topicDetailDataManager)
        detailViewModel.coordinatorDelegate = self
        let detailController = TopicDetailViewController(topicDetailViewModel: detailViewModel)
        detailViewModel.detailViewDelegate = detailController
        presenter.pushViewController(detailController, animated: true)
    }
    
    func topicsPlusButtonTapped() {
        let addTopicCoordinator = AddTopicCoordinator(presenter: self.presenter, dataManager: self.addTopicDataManager)
        addChildCoordinator(addTopicCoordinator)
        addTopicCoordinator.start()
        
        addTopicCoordinator.onTopicCreated = { [weak self] in
            guard let self = self else { return }
            
            addTopicCoordinator.finish()
            self.removeChildCoordinator(addTopicCoordinator)
            self.topicsViewModel?.newTopicWasCreated()
        }
    }
}

