//
//  LatestTopicsResponse.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 18/1/21.
//

import Foundation

// MARK: - LatestTopics
struct LatestTopicsResponse: Codable {
    let topicList: TopicList

    enum CodingKeys: String, CodingKey {
        case topicList = "topic_list"
    }
}

// MARK: - TopicList
struct TopicList: Codable {
    let topics: [Topic]

    enum CodingKeys: String, CodingKey {
        case topics
    }
}

// MARK: - Topic
struct Topic: Codable {
    let id: Int
    let title, fancyTitle, slug: String
    let postsCount, replyCount, highestPostNumber: Int
    let imageURL: String?
    let createdAt, lastPostedAt: String
    let bumped: Bool
    let bumpedAt: String
    let unseen, pinned: Bool
    let excerpt: String?
    let visible, closed, archived: Bool
    let views, likeCount: Int
    let hasSummary: Bool
    let lastPosterUsername: String
    let categoryID: Int
    let pinnedGlobally: Bool

    enum CodingKeys: String, CodingKey {
        case id, title
        case fancyTitle = "fancy_title"
        case slug
        case postsCount = "posts_count"
        case replyCount = "reply_count"
        case highestPostNumber = "highest_post_number"
        case imageURL = "image_url"
        case createdAt = "created_at"
        case lastPostedAt = "last_posted_at"
        case bumped
        case bumpedAt = "bumped_at"
        case unseen, pinned, excerpt, visible, closed, archived, views
        case likeCount = "like_count"
        case hasSummary = "has_summary"
        case lastPosterUsername = "last_poster_username"
        case categoryID = "category_id"
        case pinnedGlobally = "pinned_globally"
    }
}

