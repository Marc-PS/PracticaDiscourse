//
//  UsersDataManager.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 20/1/21.
//

import UIKit

protocol UsersDataManager: AnyObject {
    func fetchAllUsers(completion: @escaping (Result<UsersResponse?, Error>) -> ())
}
