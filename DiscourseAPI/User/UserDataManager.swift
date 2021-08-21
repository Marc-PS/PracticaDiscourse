//
//  UserDataManager.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 21/8/21.
//

import Foundation


protocol UserDataManager: AnyObject {
    func fetchUser(username: String, completion: @escaping (Result<UserResponse?, Error>) -> ())
    func updateUserName(username: String, name: String, completion: @escaping (Result<UpdateUserNameResponse?, Error>) -> ())
}
