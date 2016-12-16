//
//  AddModuleDelegate.swift
//  VIPER-SWIFT3
//
//  Created by Lun Sovathana on 12/15/16.
//  Copyright © 2016 Lun Sovathana. All rights reserved.
//

import Foundation

protocol AddModuleDelegate {
    // Upload Image Success
    func uploadImageSuccess(_ message: String, imageUrl: URL)
    // Upload Image Fail
    func uploadImageFail(_ message: String)
    
    // Post Article Success
    func postArticleSuccess(_ message: String)
    // Post Article Fail
    func postArticleFail(_ message: String)
}
