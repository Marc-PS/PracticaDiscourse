//
//  UserCellViewModel.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 20/1/21.
//

import UIKit

class UserCellViewModel {
    let user: User
    var userAvatar: UIImage?
    var userUsername: String?
    var userName: String?
    
    init(user: User, userAvatar: String, userUsername: String, userName: String) {
        self.user = user
        self.fetchUserImage(imageUrl: user.avatarTemplate)
        self.userUsername = user.username
        self.userName = user.name
    }
    
    func fetchUserImage(imageUrl: String){
        
        let sanatizedUrl = imageUrl.replacingOccurrences(of: "{size}", with: "60")
        
        let request = UserImageRequest(imageURL: sanatizedUrl)
        guard let url = request.requestWithBaseURL().url else { return }
        let networkService = SessionAPI()
        networkService.fetchImage(imageURL: url) { (image) in
            self.userAvatar = image
        }
    }
    
    
}
