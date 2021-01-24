//
//  UserCellViewModel.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 20/1/21.
//

import UIKit

class UserCellViewModel {
    let user: User
    var userAvatar: String?
    var userUsername: String?
    var userName: String?
    
    init(user: User, userAvatar: String, userUsername: String, userName: String) {
        self.user = user
        self.userAvatar = userAvatar
        self.userUsername = userUsername
        self.userName = userName
    }
    
    
}
