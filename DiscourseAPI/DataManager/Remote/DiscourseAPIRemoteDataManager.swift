//
//  DiscourseAPIRemoteDataManager.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 17/1/21.
//

import UIKit

protocol DiscourseAPIRemoteDataManager {
    func fetchTopics(completion: @escaping (Result<LatestTopicsResponse?, Error>) -> ())
    func fetchSingleTopic(id: Int, completion: @escaping (Result<SingleTopicResponse?, Error>)->())
    func deleteTopic(id: Int, completion: @escaping (Result<DeleteTopicResponse?, Error>) -> ())
    func addNewTopic(title: String, raw: String, completion: @escaping (Result<AddNewTopicResponse?, Error>) -> ())
    func fetchCategories(completion: @escaping (Result<CategoriesResponse?, Error>) -> ())
    func fetchUsers(completion: @escaping (Result<UserListResponse?, Error>)->())
    func fetchSingleUser(userName: String, completion: @escaping (Result<SingleUserResponse?, Error>)->())
    func updateUser(nameUser: String, newName: String, completion: @escaping(Result<SingleUserResponse?, Error>) ->())
    func fetchUserImage(imageURL: String, completion: @escaping (_ image: UIImage)->())
}
