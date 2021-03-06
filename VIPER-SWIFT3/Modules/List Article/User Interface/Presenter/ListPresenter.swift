//
//  ListPresenter.swift
//  VIPER-SWIFT3
//
//  Created by Lun Sovathana on 12/13/16.
//  Copyright © 2016 Lun Sovathana. All rights reserved.
//

import Foundation

class ListPresenter{
    
    // ListIteratorInput
    var listInteractor : ListInteractorInput?
    
    // ListWireframe
    var listWireframe       : ListWireframe?
    
    // ListViewProtocol
    var listViewProtocol    : ListViewProtocol?
    
    
    
}

extension ListPresenter : ListModuleProtocol{
    
    func addNewArticle() {
        listWireframe?.presentAddInterface()
    }
    
    func loadArticle(title: String, page: Int, limit: Int) {
        listInteractor?.findArticle(title: title, page: page, limit: limit)
    }
    
    func deleteArticleById(_ id: Int) {
        listInteractor?.deleteArticle(id)
    }
    
    func operationCompletion(_ isSuccess: Bool) {
        if isSuccess{
            listViewProtocol?.operationSuccess()
        }else{
            listViewProtocol?.operationFail()
        }
    }
    
}

extension ListPresenter : ListInteractorOutput{
    
    func responseData(_ data: ArticleArray) {
        
        if (data.data?.count)! > 0{
            listViewProtocol?.updateViewWithData(data)
        }else{
            listViewProtocol?.updateViewWithoutData()
        }
    
    }
    
}
