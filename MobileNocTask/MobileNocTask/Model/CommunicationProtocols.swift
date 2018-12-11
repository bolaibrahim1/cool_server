
import Foundation
import ObjectMapper

struct CommunicationProtocols : Mappable {
    var id : Int?
    var name : String?
    var defaultPort : Int?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        name <- map["name"]
        defaultPort <- map["defaultPort"]
    }

}
