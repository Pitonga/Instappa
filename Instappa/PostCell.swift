//
//  PostCell.swift
//  Instappa
//
//  Created by Edwin M. Rivera on 3/6/16.
//  Copyright © 2016 CodePath Marky. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class PostCell: UITableViewCell {

    @IBOutlet weak var postImageView: PFImageView!

    @IBOutlet weak var captionLabel: UILabel!
    
    var instaPost: PFObject! {
        didSet {
            self.captionLabel.text = instaPost["caption"] as? String
            self.postImageView.file = instaPost["media"] as? PFFile
            self.postImageView.loadInBackground()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
