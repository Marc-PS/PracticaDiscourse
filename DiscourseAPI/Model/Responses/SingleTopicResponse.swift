//
//  SingleTopicResponse.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 18/1/21.
//

import Foundation

struct SingleTopicResponse: Codable {
    let id: Int
    let title: String
    let details: PostDetails
    let numberOfPosts: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case details
        case numberOfPosts = "posts_count"
    }
}

struct PostDetails: Codable{
    let isDeletable: Bool?
    
    enum CodingKeys: String, CodingKey {
        case isDeletable = "can_delete"
    }
}
