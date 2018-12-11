
import Foundation
import ObjectMapper

struct Model : Mappable {
    var id : Int?
    var name : String?
    var creationDate : String?
    var expiryDate : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        name <- map["name"]
        creationDate <- map["creationDate"]
        expiryDate <- map["expiryDate"]
    }

}
