//
//  ListIterator.swift
//  VIPER-SWIFT3
//
//  Created by Lun Sovathana on 12/14/16.
//  Copyright © 2016 Lun Sovathana. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class ListInterator : ListInteractorInput{
    
    // ListInteractorOutput
    var listInteractorOutput:ListInteractorOutput?
    
    func findAllArticle() {
        Alamofire.request(URL(string: FIND_ALL_ARTICLES_URL)!, method: HTTPMethod.get, parameters: nil, encoding: JSONEncoding.default, headers: COMMON_HEADERS).responseObject(completionHandler: { (response:DataResponse<ArticleArray>) in
            print(response.result.value!)
            // Call Back with data
            self.listInteractorOutput?.responseData(response.result.value!)
            
        })
    }
    
    func deleteArticle(_ id: Int) {
        // Delete Article
        Alamofire.request(DELETE_ARTICLE_BY_ID + "/\(id)", method: HTTPMethod.delete, parameters: nil, encoding: URLEncoding.default, headers: COMMON_HEADERS).responseJSON(completionHandler: { response in
        
            if let result = response.result.value as? [String: AnyObject]{
                
                if (result[RESPONSE_KEY.code] as! String) == RESPONSE_CODE.success{
                    print(result[RESPONSE_KEY.code] as! String)
                    self.listInteractorOutput?.operationCompletion(true)
                }else{
                    self.listInteractorOutput?.operationCompletion(false)
                }
            }
            
            
        })
    }
    
}
