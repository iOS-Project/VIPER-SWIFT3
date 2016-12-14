//
//  ListViewProtocol.swift
//  VIPER-SWIFT3
//
//  Created by Lun Sovathana on 12/13/16.
//  Copyright © 2016 Lun Sovathana. All rights reserved.
//

import Foundation
protocol ListViewProtocol {
    func updateViewWithoutData()
    func updateViewWithData(_ data: ArticleArray)
    func operationSuccess()
    func operationFail()
    func reloadEntities()
}
