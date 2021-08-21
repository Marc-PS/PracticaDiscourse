//
//  DiscourseAPIDataManager.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 17/1/21.
//

import UIKit

class DiscourseAPIDataManager {
    let localDataManager: DiscourseAPILocalDataManager
    let remoteDataManager: DiscourseAPIRemoteDataManager
    
    init(localDataManager: DiscourseAPILocalDataManager, remoteDataManager: DiscourseAPIRemoteDataManager) {
        self.localDataManager = localDataManager
        self.remoteDataManager = remoteDataManager
    }
}

extension DiscourseAPIDataManager: TopicsDataManager{
    func fetchTopics(completion: @escaping (Result<LatestTopicsResponse?, Error>) -> ()) {
        remoteDataManager.fetchTopics(completion: completion)
    }
}

extension DiscourseAPIDataManager: TopicDetailDataManager{

    func fetchTopic(id: Int, completion: @escaping (Result<SingleTopicResponse?, Error>) -> ()) {
        remoteDataManager.fetchSingleTopic(id: id, completion: completion)
    }
    
    func deleteTopic(id: Int, completion: @escaping (Result<DeleteTopicResponse?, Error>) -> ()) {
        remoteDataManager.deleteTopic(id: id, completion: completion)
    }
}

extension DiscourseAPIDataManager: AddTopicDataManager{
    func addTopic(title: String, raw: String, completion: @escaping (Result<AddNewTopicResponse?, Error>) -> ()) {
        remoteDataManager.addNewTopic(title: title, raw: raw, completion: completion)
    }
    
}

extension DiscourseAPIDataManager: CategoriesDataManager {
    
    func fetchCategories(completion: @escaping (Result<CategoriesResponse?, Error>) -> ()) {
        remoteDataManager.fetchCategories(completion: completion)
    }
}

extension DiscourseAPIDataManager: UsersDataManager {
    func fetchAllUsers(completion: @escaping (Result<UsersResponse?, Error>) -> ()) {
        remoteDataManager.fetchAllUsers(completion: completion)
    }

}

extension DiscourseAPIDataManager: UserDataManager {
    func fetchUser(username: String, completion: @escaping (Result<UserResponse?, Error>) -> ()) {
        remoteDataManager.fetchUser(username: username, completion: completion)
    }

    func updateUserName(username: String, name: String, completion: @escaping (Result<UpdateUserNameResponse?, Error>) -> ()) {
        remoteDataManager.updateUserName(username: username, name: name, completion: completion)
    }

}
