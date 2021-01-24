//
//  DeleteTopicRequest.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 21/1/21.
//

import Foundation

struct DeleteTopicRequest: APIRequest {
    
    typealias Response = DeleteTopicResponse
    
    var id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    var method: Method {
        return .DELETE
    }
    
    var path: String {
        return "/t/\(id).json"
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
