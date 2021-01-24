//
//  CategoryCell.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 20/1/21.
//

import UIKit

class CategoryCell: UITableViewCell {
  
    @IBOutlet weak var categoryNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var viewModel: CategoryCellViewModel? {
        didSet{
            self.categoryNameLabel.text = viewModel?.category.name
        }
    }
}
