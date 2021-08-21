//
//  UsersDataManager.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 20/1/21.
//

import UIKit

enum UsersDataManagerError: Error {
    case unknown
}

protocol UsersDataManager {
    func fetchUsers(completion: @escaping (Result<UserListResponse?, Error>) -> ())
    func fetchUserImage(imageURL: String, completion: @escaping (_ image: UIImage)->())
}
