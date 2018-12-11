
import Foundation
import ObjectMapper

struct Status : Mappable {
    var id : Int?
    var statusValue : String?
    var legacyValue : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        statusValue <- map["statusValue"]
        legacyValue <- map["legacyValue"]
    }

}
