//
//  AddPresenter.swift
//  VIPER-SWIFT3
//
//  Created by Lun Sovathana on 12/15/16.
//  Copyright © 2016 Lun Sovathana. All rights reserved.
//

import UIKit

class AddPresenter : AddModuleProtocol{
    
    // Add Wireframe
    var addWireframe : AddWireframe?
    // AddModuleDelegate
    var addModuleDelegate : AddModuleDelegate?
    // AddInteractorInput
    var addInteractorInput : AddInteractorInput?
    
    func uploadImage(_ image: UIImage) {
        addInteractorInput?.uploadImage(image)
    }
    
    func postArticle(_ article: Article) {
        addInteractorInput?.postArticle(article)
    }
    
    func backToRootViewController() {
        addWireframe?.dismissAddInterface()
    }
    
}

extension AddPresenter : AddInteractorOutput{
    
    func uploadImageComplete(_ isSuccess: Bool, withURL url: URL, andMessage message: String) {
        if isSuccess{
            addModuleDelegate?.uploadImageSuccess(message, imageUrl: url)
        }else{
            addModuleDelegate?.uploadImageFail(message)
        }
        
    }
    
    func postArticleComplete(_ isSuccess: Bool, andMessage message: String) {
        if isSuccess{
            addModuleDelegate?.postArticleSuccess(message)
        }else{
            addModuleDelegate?.postArticleFail(message)
        }
    }
    
}

