//
//  UsersRequest.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 20/1/21.
//

import Foundation

struct UserListRequest: APIRequest {
   
    typealias Response = UserListResponse
    
    var method: Method {
        return .GET
    }
    //Elijo mensual para que salgamos los compañeros del bootcamp
    var path: String {
        return "/directory_items.json?period=all&order=topic_count"
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
