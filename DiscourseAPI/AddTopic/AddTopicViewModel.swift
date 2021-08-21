//
//  AddTopicViewModel.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 19/1/21.
//

import Foundation

protocol AddTopicCoordinatorDelegate: AnyObject {
    func addTopicCancelButtonTapped()
    func topicSuccessfullyAdded()
}

protocol AddTopicViewDelegate: AnyObject {
    func errorAddingTopic()
}

class AddTopicViewModel {
    weak var addTopicViewDelegate: AddTopicViewDelegate?
    var coordinatorDelegate: AddTopicCoordinatorDelegate?
    let dataManager: AddTopicDataManager
    
    init(dataManager: AddTopicDataManager) {
        self.dataManager = dataManager
    }
    
    func cancelButtonTapped() {
        coordinatorDelegate?.addTopicCancelButtonTapped()
    }
    
    func submitNewTopic(title: String, raw: String) {
        dataManager.addTopic(title: title, raw: raw) { (result) in
            switch result {
                case .success(_):
                    self.coordinatorDelegate?.topicSuccessfullyAdded()
                case .failure:
                    self.addTopicViewDelegate?.errorAddingTopic()
            }
        }
    }
}
