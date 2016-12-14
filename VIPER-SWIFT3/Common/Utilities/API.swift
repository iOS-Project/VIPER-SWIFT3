//
//  API.swift
//  VIPER-SWIFT3
//
//  Created by Lun Sovathana on 12/14/16.
//  Copyright © 2016 Lun Sovathana. All rights reserved.
//

import Foundation
import Alamofire

let COMMON_HEADERS : HTTPHeaders = [
    "Authorization" : "Basic QU1TQVBJQURNSU46QU1TQVBJUEBTU1dPUkQ="
]

let BASE_URL = "http://120.136.24.174:1301"
let FIND_ALL_ARTICLES_URL = BASE_URL + "/v1/api/articles"
let DELETE_ARTICLE_BY_ID = FIND_ALL_ARTICLES_URL

// Response Key
let RESPONSE_KEY = (code : "CODE", message :"MESSAGE")
// Response Code
let RESPONSE_CODE = (success : "0000", fail: "9999")
