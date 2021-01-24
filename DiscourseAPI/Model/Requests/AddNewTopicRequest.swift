//
//  AddNewTopicRequest.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 18/1/21.
//

import Foundation

struct AddNewTopicRequest: APIRequest {
    
    typealias Response = AddNewTopicResponse
    
    let title: String
    let raw: String
    
    init(title: String, raw: String) {
        self.title = title
        self.raw = raw
        self.newBody()
    }
    
    var method: Method {
        return .POST
    }
    
    var path: String {
        return "/posts"
    }
    
    var parameters: [String : String] {
        return [:]
    }
    
    var body: [String : Any] = [:]
    
    
    var headers: [String : String] {
        return [:]
    }
    
    private mutating func newBody() {
        self.body["title"] = self.title
        self.body["raw"] = self.raw
    }

    
}
