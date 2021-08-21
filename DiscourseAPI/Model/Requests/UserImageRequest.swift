//
//  UserImageRequest.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 21/8/21.
//

import UIKit


struct UserImageRequest: APIRequest {
    
    typealias Response = UserImageResponse
    
    var path: String = ""
    
    var method: Method {
        return .GET
    }
    
    var headers: [String : String] = [:]
    
    var body: [String : Any] = [:]
    
    var parameters: [String : String] = [:]
    

    init(imageURL: String) {
        self.path.append(imageURL)
    }
    
   
    
    
}
