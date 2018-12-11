
import Foundation
import ObjectMapper

struct Type : Mappable {
    var id : Int?
    var name : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        name <- map["name"]
    }

}
