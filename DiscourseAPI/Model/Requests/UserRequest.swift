//
//  UserImageRequest.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 24/1/21.
//

import Foundation

class UserRequest: APIRequest {
    typealias Response = UserResponse

    let username: String

    init(username: String) {
        self.username = username
    }

    var method: Method {
        return .GET
    }

    var path: String {
        return "/users/\(username).json"
    }

    var parameters: [String : String] {
        return [:]
    }

    var body: [String : Any] {
        return [:]
    }

    var headers: [String : String] {
        return [:]
    }
}
