//
//  UserCell.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 20/1/21.
//

import UIKit

class UserCell: UITableViewCell {
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var name: UILabel!
    
    var viewModel: UserCellViewModel? {
        didSet {
            self.avatar.image = viewModel?.userAvatar
            self.username.text = viewModel?.userUsername
            self.name.text = viewModel?.userName
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.avatar.image = nil
        self.username.text = nil
        self.name.text = nil
    }
    
}

