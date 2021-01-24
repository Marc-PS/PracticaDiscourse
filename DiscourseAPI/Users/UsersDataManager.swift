//
//  UsersDataManager.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 20/1/21.
//

import Foundation

enum UsersDataManagerError: Error {
    case unknown
}

protocol UsersDataManager {
    func fetchUsers(completion: @escaping (Result<UserListResponse?, Error>) -> ())
}
