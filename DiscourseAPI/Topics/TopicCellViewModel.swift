//
//  TopicCellViewModel.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 17/1/21.
//

import Foundation

class TopicCellViewModel {
    let topic: Topic
    var textLabelText: String?
    
    init(topic: Topic) {
        self.topic = topic
        textLabelText = topic.title
    }
}
