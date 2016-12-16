//
//  AddModuleProtocol.swift
//  VIPER-SWIFT3
//
//  Created by Lun Sovathana on 12/15/16.
//  Copyright © 2016 Lun Sovathana. All rights reserved.
//
import UIKit

protocol AddModuleProtocol {
    
    // Upload Image
    func uploadImage(_ image: UIImage)
    
    // PostArticle
    func postArticle(_ article: Article)
    
    // Back
    func backToRootViewController()
    
}
