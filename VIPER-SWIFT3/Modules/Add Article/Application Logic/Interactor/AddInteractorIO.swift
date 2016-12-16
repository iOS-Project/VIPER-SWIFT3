//
//  AddInteractorIO.swift
//  VIPER-SWIFT3
//
//  Created by Lun Sovathana on 12/15/16.
//  Copyright © 2016 Lun Sovathana. All rights reserved.
//

import UIKit

protocol AddInteractorInput {
    
    // Upload Image
    func uploadImage(_ image: UIImage)
    
    // Post Article
    func postArticle(_ article: Article)
    
}

protocol AddInteractorOutput {
    
    // Upload Complete
    func uploadImageComplete(_ isSuccess: Bool, withURL url: URL, andMessage message: String)
    
    // Post Complete
    func postArticleComplete(_ isSuccess: Bool, andMessage message: String)
}
