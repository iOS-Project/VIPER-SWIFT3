//
//  ListModuleProtocol.swift
//  VIPER-SWIFT3
//
//  Created by Lun Sovathana on 12/13/16.
//  Copyright © 2016 Lun Sovathana. All rights reserved.
//

import Foundation

protocol ListModuleProtocol {
    // Add New Article
    func addNewArticle()
    
    // Load Article
    func loadArticle(title: String, page: Int, limit: Int)
    
    // Delete article
    func deleteArticleById(_ id: Int)
}
