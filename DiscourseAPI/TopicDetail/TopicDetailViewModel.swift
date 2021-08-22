//
//  TopicDetailViewModel.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 19/1/21.
//

import Foundation

protocol TopicDetailCoordinatorDelegate: AnyObject {
    func topicDetailBackButtonTapped()
    func topicSuccessfullyDeleted()
}

protocol TopicDetailViewDelegate: AnyObject {
    func topicDetailFetched()
    func errorFetchingTopicDetail()
    func errorDeletingTopic()
}

class TopicDetailViewModel {

    weak var detailViewDelegate: TopicDetailViewDelegate?
    weak var coordinatorDelegate: TopicDetailCoordinatorDelegate?
    let topicDetailDataManager: TopicDetailDataManager
    
    let topic: Topic
    var topicDetailID: String?
    var topicDetailTitle: String?
    var numberOfPosts: Int?
    var isDeletable = true
    let id: Int
    
    init(topic: Topic, topicDetailDataManager: TopicDetailDataManager, id: Int) {
        self.topic = topic
        self.id = id
        self.topicDetailDataManager = topicDetailDataManager
        
        
    }
    
    func viewDidLoad() {
        topicDetailDataManager.fetchTopic(id: id) { [weak self] (result) in
            switch result {
                case .success(let response):
                    guard let response = response else { return }
                    
                    self?.topicDetailID = response.id.description
                    self?.topicDetailTitle = response.title
                    self?.numberOfPosts = response.numberOfPosts
   
                    self?.isDeletable = !(response.details.canDelete ?? false)
                    self?.detailViewDelegate?.topicDetailFetched()
                case .failure(_):
                    print("Failure getting topics details")
                    self?.detailViewDelegate?.errorFetchingTopicDetail()
            }
        }
    }
    
    func backButtonTapped() {
        coordinatorDelegate?.topicDetailBackButtonTapped()
    }
    
    func deleteButtonTapped() {
        topicDetailDataManager.deleteTopic(id: id) { [weak self] (result) in
            switch result {
            case .success:
                self?.coordinatorDelegate?.topicSuccessfullyDeleted()
            case .failure:
                self?.detailViewDelegate?.errorDeletingTopic()
            }
        }
    }
}
