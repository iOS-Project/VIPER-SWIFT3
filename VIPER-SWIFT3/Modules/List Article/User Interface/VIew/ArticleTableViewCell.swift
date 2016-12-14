//
//  ArticleTableViewCell.swift
//  VIPER-SWIFT3
//
//  Created by Lun Sovathana on 12/12/16.
//  Copyright © 2016 Lun Sovathana. All rights reserved.
//

import UIKit
import Kingfisher

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var artImage: UIImageView!
    @IBOutlet weak var artTitleLabel: UITextView!
    @IBOutlet weak var artDescriptionLabel: UITextView!
    
    func configureCell(_ article: Article){
        artTitleLabel.text = article.title
        artDescriptionLabel.text = article.description
        if let imageURL = article.imageUrl, let url = URL(string: imageURL){
            artImage.kf.setImage(with: url, placeholder: UIImage(named: "placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
        }
        
    }
    
}
