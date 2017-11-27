//
//  ArticleTableViewCell.swift
//  testApp
//
//  Created by Владислав on 25.11.2017.
//  Copyright © 2017 Владислав. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
 
    @IBOutlet weak var imageViewCell: UIImageView!
    @IBOutlet weak var titleCell: UILabel!
    @IBOutlet weak var textViewCell: UILabel!
    @IBOutlet weak var author: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}