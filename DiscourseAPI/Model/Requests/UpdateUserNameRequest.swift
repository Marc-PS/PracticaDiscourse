//
//  UpdateUserRequest.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 24/1/21.
//

import Foundation

class UpdateUserNameRequest: APIRequest {
    typealias Response = UpdateUserNameResponse

    let username: String
    let name: String

    init(username: String, name: String) {
        self.username = username
        self.name = name
    }

    var method: Method {
        return .PUT
    }

    var path: String {
        return "/users/\(username)"
    }

    var parameters: [String : String] {
        return [:]
    }

    var body: [String : Any] {
        return ["name": name]
    }

    var headers: [String : String] {
        return [:]
    }
}
