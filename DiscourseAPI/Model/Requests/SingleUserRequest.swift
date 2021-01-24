//
//  UserImageRequest.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 24/1/21.
//

import Foundation

struct SingleUserRequest: APIRequest {
   
    typealias Response = SingleUserResponse
    
    let userName: String
    
    init(userName: String) {
        self.userName = userName
    }
    
    var method: Method {
        return .GET
    }
    
    var path: String {
        return "/users/\(userName).json"
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
