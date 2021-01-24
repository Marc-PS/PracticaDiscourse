//
//  TopicCell.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 17/1/21.
//

import UIKit

class TopicCell: UITableViewCell {
    
    
    @IBOutlet weak var topicTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    var viewModel: TopicCellViewModel? {
        didSet{
            self.topicTextLabel.text = viewModel?.topic.title
        }
    }
    
}
