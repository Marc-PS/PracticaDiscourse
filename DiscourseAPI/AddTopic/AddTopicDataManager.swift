//
//  AddTopicDataManager.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 18/1/21.
//

import Foundation

protocol AddTopicDataManager: AnyObject {
    func addTopic(title: String, raw: String, completion: @escaping (Result<AddNewTopicResponse?, Error>) -> ())
}
