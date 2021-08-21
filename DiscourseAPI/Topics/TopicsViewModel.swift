//
//  TopicsViewModel.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 17/1/21.
//

import Foundation

protocol TopicsCoordinatorDelegate: AnyObject {
    func didSelect(topic: Topic)
    func topicsPlusButtonTapped()
}

protocol TopicsViewDelegate: AnyObject {
    func topicsFetched()
    func errorFetchingTopics()
}

class TopicsViewModel {
    weak var coordinatorDelegate: TopicsCoordinatorDelegate?
    weak var topicsViewDelegate: TopicsViewDelegate?
    let topicsDataManager: TopicsDataManager
    
    var topicsViewModel: [TopicCellViewModel] = []
    
    init(topicsDataManager: TopicsDataManager) {
        self.topicsDataManager = topicsDataManager
    }
    
    func viewWasLoaded() {
        topicsDataManager.fetchTopics { [weak self] result in
            switch result{
                case .success(let response):
                    guard let fetchedTopics = response?.topicList.topics else { return }
                    for topic in fetchedTopics {
                        self?.topicsViewModel.append(TopicCellViewModel(topic: topic))
                    }
                    self?.topicsViewDelegate?.topicsFetched()
                    
                case .failure:
                    self?.topicsViewDelegate?.errorFetchingTopics()
            }
        }
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return topicsViewModel.count
    }
    
    func viewCellModel(index: Int) -> TopicCellViewModel?{
        guard index < topicsViewModel.count else { return nil }
        return topicsViewModel[index]
    }
    
    func didSelectATopic(at index: Int){
        guard index < topicsViewModel.count else { return }
        let topic = topicsViewModel[index].topic
        coordinatorDelegate?.didSelect(topic: topic)
    }
    
    func plusButtonTapped() {
        coordinatorDelegate?.topicsPlusButtonTapped()
    }
    
    func newTopicWasCreated() {
        viewWasLoaded()
    }
}
