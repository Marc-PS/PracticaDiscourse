//
//  UsersResponse.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 18/1/21.
//

import Foundation

// MARK: - UsersResponse
struct UserListResponse: Codable {
    let directoryItems: [DirectoryItem]

    enum CodingKeys: String, CodingKey {
        case directoryItems = "directory_items"
    }
}
// MARK: - DirectoryItem
struct DirectoryItem: Codable {
    let id: Int
    let user: User

    enum CodingKeys: String, CodingKey {
        case id
        case user
    }
}
// MARK: - User
struct User: Codable {
    let id: Int
    let username, name, avatarTemplate, lastPostedAt: String
    let lastSeenAt, createdAt: String
    let canEdit, canEditUsername, canEditEmail, canEditName: Bool?
    


    enum CodingKeys: String, CodingKey {
        case id, username, name
        case avatarTemplate = "avatar_template"
        case lastPostedAt = "last_posted_at"
        case lastSeenAt = "last_seen_at"
        case createdAt = "created_at"
        case canEdit = "can_edit"
        case canEditUsername = "can_edit_username"
        case canEditEmail = "can_edit_email"
        case canEditName = "can_edit_name"
    }
}
