//
//  Model.swift
//  VIPER-SWIFT3
//
//  Created by Lun Sovathana on 12/12/16.
//  Copyright © 2016 Lun Sovathana. All rights reserved.
//

import Foundation
import ObjectMapper

class Article : Mappable{
    
    var id:Int?
    var title:String?
    var description:String?
    var createdDate:String?
    var imageUrl:String?
    var status:String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id          <- map["ID"]
        title       <- map["TITLE"]
        description <- map["DESCRIPTION"]
        createdDate <- map["CREATED_DATE"]
        imageUrl    <- map["IMAGE"]
        status      <- map["STATUS"]
    }
    
}

class Pagination : Mappable{
    
    var page:Int?
    var limit:Int?
    var totalCount:Int?
    var totalPages:Int?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        page        <- map["PAGE"]
        limit       <- map["LIMIT"]
        totalCount  <- map["TOTAL_COUNT"]
        totalPages  <- map["TOTAL_PAGES"]
    }
}

class ArticleArray : Mappable{
    var data:[Article]?
    var pagination:Pagination?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        data        <- map["DATA"]
        pagination  <- map["PAGINATION"]
    }
}
