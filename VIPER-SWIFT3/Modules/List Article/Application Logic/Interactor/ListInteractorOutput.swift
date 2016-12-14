//
//  ListInteractorOutput.swift
//  VIPER-SWIFT3
//
//  Created by Lun Sovathana on 12/13/16.
//  Copyright © 2016 Lun Sovathana. All rights reserved.
//

import Foundation

protocol ListInteractorOutput {
    func responseData(_ data: ArticleArray)
    func operationCompletion(_ isSuccess: Bool)
}
