//
//  DataModel.swift
//  MobileNocTask
//
//  Created by Bola Ibrahim on 12/8/18.
//  Copyright © 2018 BolaIbrahim. All rights reserved.
//

import Foundation
import ObjectMapper

struct DataModel : Mappable {
    var content : [Content]?
    var last : Bool?
    var totalPages : Int?
    var totalElements : Int?
    var sort : String?
    var numberOfElements : Int?
    var first : Bool?
    var size : Int?
    var number : Int?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        content <- map["content"]
        last <- map["last"]
        totalPages <- map["totalPages"]
        totalElements <- map["totalElements"]
        sort <- map["sort"]
        numberOfElements <- map["numberOfElements"]
        first <- map["first"]
        size <- map["size"]
        number <- map["number"]
    }
    
}


