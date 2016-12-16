//
//  AddInteractor.swift
//  VIPER-SWIFT3
//
//  Created by Lun Sovathana on 12/15/16.
//  Copyright © 2016 Lun Sovathana. All rights reserved.
//

import UIKit
import Alamofire

class AddInteractor : AddInteractorInput{
    
    // AddInteractorOutput
    var out : AddInteractorOutput?
    
    func uploadImage(_ image: UIImage) {
        
        let imageData = UIImagePNGRepresentation(image)
        
        Alamofire.upload(multipartFormData: { formData in
            formData.append(imageData!, withName: "FILE", fileName: "image.png", mimeType: "image/png")
        }, usingThreshold: 0, to: URL(string: UPLOAD_SINGLE_IMAGE)!, method: HTTPMethod.post, headers: COMMON_HEADERS){
            encodingResult in
            
            switch encodingResult{
                case .success(let upload, _, _):
                    upload.responseJSON(completionHandler: { response in
                        
                        if let value = response.result.value as? [String : AnyObject]{
                            let success = (value[RESPONSE_KEY.code] as! String) == RESPONSE_CODE.success
                            self.out?.uploadImageComplete(success, withURL: URL(string: value[RESPONSE_KEY.data] as! String)!, andMessage: value[RESPONSE_KEY.message] as! String)
                        }
                        
                    })
                case .failure(let error):
                    debugPrint(error.localizedDescription)
            }
            
        }
    }
    
    func postArticle(_ article: Article) {
        let param : Parameters = article.toJSON()
        Alamofire.request(URL(string: ARTICLE_URL)!, method: .post, parameters: param, encoding: JSONEncoding.default, headers: COMMON_HEADERS).responseJSON{
            
            response in
            
            if let value = response.result.value as? [String : Any]{
                let success = (value[RESPONSE_KEY.code] as! String) == RESPONSE_CODE.success
                self.out?.postArticleComplete(success, andMessage: value[RESPONSE_KEY.message] as! String)
            }
            
        }
    }
    
}
