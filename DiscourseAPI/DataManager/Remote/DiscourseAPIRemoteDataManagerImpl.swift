//
//  DiscourseAPIRemoteDataManagerImpl.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 17/1/21.
//

import UIKit

class DiscourseAPIRemoteDataManagerImpl: DiscourseAPIRemoteDataManager {
   
    let session: SessionAPI
    
    init(session: SessionAPI) {
        self.session = session
    }
    
    func fetchTopics(completion: @escaping (Result<LatestTopicsResponse?, Error>) -> ()) {
        let request = LatestTopicsRequest()
        session.send(request: request) { result in
            completion(result)
        }
    }

    func fetchSingleTopic(id: Int, completion: @escaping (Result<SingleTopicResponse?, Error>) -> ()) {
        let request = SingleTopicRequest(id: id)
        session.send(request: request) { result in
            completion(result)
        }
    }

    func addNewTopic(title: String, raw: String, completion: @escaping (Result<AddNewTopicResponse?, Error>) -> ()) {
        let request = AddNewTopicRequest(title: title, raw: raw)
        session.send(request: request) { result in
            completion(result)
        }
    }
    
    func deleteTopic(id: Int, completion: @escaping (Result<DeleteTopicResponse?, Error>) -> ()) {
        let request = DeleteTopicRequest(id: id)
        session.send(request: request) { result in
            completion(result)
        }
    }
    
    func fetchCategories(completion: @escaping (Result<CategoriesResponse?, Error>) -> ()) {
        let request = CategoriesRequest()
        session.send(request: request) { result in
            completion(result)
        }
    }
    
    func fetchUsers(completion: @escaping (Result<UserListResponse?, Error>) -> ()) {
        let request = UserListRequest()
        session.send(request: request) { result in
            completion(result)
        }
    }
    
    func fetchSingleUser(userName: String, completion: @escaping (Result<SingleUserResponse?, Error>) -> ()) {
    
        let request = SingleUserRequest(userName: userName)
        session.send(request: request) { result in
            completion(result)
        }
    }
    
    func updateUser(nameUser: String, newName: String, completion: @escaping (Result<SingleUserResponse?, Error>) -> ()) {
        let request = UpdateUserRequest(nameUser: nameUser, newName: newName)
        session.send(request: request) { result in
            completion(result)
        }
    }
    
    func fetchUserImage(imageURL: String, completion: @escaping (UIImage) -> ()) {
        let  request = UserImageRequest(imageURL: imageURL)
        guard let url = request.requestWithBaseURL().url else {return}
        
        self.session.fetchImage(imageURL: url, completion: completion)
    }
    

}
