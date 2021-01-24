//
//  TopicDetailViewModel.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 19/1/21.
//

import Foundation

protocol TopicDetailCoordinatorDelegate: class {
    func topicDetailBackButtonTapped()
}

protocol TopicDetailViewDelegate: class {
    func topicDetailFetched()
    func errorFetchingTopicDetail()
    func didDeleteTopic()
}

class TopicDetailViewModel {

    weak var detailViewDelegate: TopicDetailViewDelegate?
    weak var coordinatorDelegate: TopicDetailCoordinatorDelegate?
    let topicDetailDataManager: TopicDetailDataManager
    
    let topic: Topic
    var topicDetailID: String?
    var topicDetailTitle: String?
    var numberOfPosts: Int?
    var isDeletable: Bool?
    
    init(topic: Topic, topicDetailDataManager: TopicDetailDataManager) {
        self.topic = topic
        self.topicDetailDataManager = topicDetailDataManager
        
        
    }
    
    func viewDidLoad() {
        let id = self.topic.id
        topicDetailDataManager.fetchTopic(id: id, completion: { (result) in
            switch result {
                case .success(let response):
                    self.topicDetailID = response?.id.description
                    self.topicDetailTitle = response?.title
                    self.numberOfPosts = response?.numberOfPosts
   
                    if let deletable = response?.details.isDeletable{
                        self.isDeletable = deletable
                    } else {
                        self.isDeletable = false
                    }
                    self.detailViewDelegate?.topicDetailFetched()
                case .failure(_):
                    print("Failure getting topics details")
            }
        })
    }
    
    func backButtonTapped() {
        coordinatorDelegate?.topicDetailBackButtonTapped()
    }
    
    func deleteButtonTapped(id: Int) {
        topicDetailDataManager.deleteTopic(id: id, completion: { (result) in
            switch result {
                case .success:
                    self.detailViewDelegate?.didDeleteTopic()
                    self.backButtonTapped()
                case .failure:
                    print("Error deleting topic")
            }
        })
    }
}
