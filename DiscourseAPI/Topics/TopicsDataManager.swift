//
//  TopicsDataManager.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 17/1/21.
//

import Foundation

enum TopicsDataManagerError: Error {
    case unknown
}

protocol TopicsDataManager: AnyObject {
    func fetchTopics(completion: @escaping (Result<LatestTopicsResponse?, Error>) -> ())
}
