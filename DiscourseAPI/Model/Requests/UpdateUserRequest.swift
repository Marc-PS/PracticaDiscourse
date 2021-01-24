//
//  UpdateUserRequest.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 24/1/21.
//

import Foundation

struct UpdateUserRequest: APIRequest {
   
    typealias Response = SingleUserResponse
    
    var nameUser: String
    
    init(nameUser: String, newName: String) {
        self.nameUser = nameUser
        self.body["name"] = newName
    }
    
    var method: Method {
        return .PUT
    }
    
    var path: String {
        return "/users/\(nameUser)/preferences/name"
    }
    
    var parameters: [String : String] {
        return [:]
    }
    
    var body: [String : Any] = [:]
    
    var headers: [String : String] {
        return [:]
    }

}
