//
//  UserCell.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 20/1/21.
//

import UIKit

class UserCell: UITableViewCell {
    
    @IBOutlet var username: UILabel!
    @IBOutlet var userName: UILabel!
    @IBOutlet var userImage: UIImageView!
    
    var viewModel: UserCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            viewModel.viewDelegate = self
            
            self.userName.text = viewModel.userName
            self.username.text = viewModel.username
            self.userImage.image = viewModel.userImage
        }
    }
}

extension UserCell: UserCellViewModelViewDelegate {
    func userImageFetched() {
        self.userImage.image = viewModel?.userImage
        setNeedsLayout()
    }
}

