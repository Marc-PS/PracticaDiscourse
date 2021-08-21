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
    
    func configure(category: Category) {
        self.categoryNameLabel.text = category.name
    
    }
}
