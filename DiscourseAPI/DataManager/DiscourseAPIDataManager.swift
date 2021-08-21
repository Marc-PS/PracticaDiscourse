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
    
    func fetchUsers(completion: @escaping (Result<UserListResponse?, Error>) -> ()) {
        remoteDataManager.fetchUsers(completion: completion)
    }
    
    func fetchUser(userName: String, completion: @escaping (Result<SingleUserResponse?, Error>) -> ()) {
        remoteDataManager.fetchSingleUser(userName: userName, completion: completion)
    }
    
    func updateUser(user nameUser: String, newName: String, completion: @escaping (Result<SingleUserResponse?, Error>) -> ()) {
        remoteDataManager.updateUser(nameUser: nameUser, newName: newName, completion: completion)

    }
    
    func fetchUserImage(imageURL: String, completion: @escaping (UIImage) -> ()) {
        remoteDataManager.fetchUserImage(imageURL: imageURL, completion: completion)
    }

}
