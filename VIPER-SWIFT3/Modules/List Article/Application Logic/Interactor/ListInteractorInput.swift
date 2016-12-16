//
//  ListInteractorInput.swift
//  VIPER-SWIFT3
//
//  Created by Lun Sovathana on 12/13/16.
//  Copyright © 2016 Lun Sovathana. All rights reserved.
//

import Foundation

protocol ListInteractorInput{
    func findArticle(title: String, page: Int, limit: Int)
    func deleteArticle(_ id: Int)
}
