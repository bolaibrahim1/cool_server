
import Foundation
import ObjectMapper

struct Content : Mappable {
    var id : Int?
    var name : String?
    var ipAddress : String?
    var ipSubnetMask : String?
    var model : Model?
    var locationId : Int?
    var status : Status?
    var type : Type?
    var serialNumber : String?
    var version : String?
    var communicationProtocols : [CommunicationProtocols]?
    var targetMachines : [TargetMachines]?
    var location : Int?
    var serialNum : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        name <- map["name"]
        ipAddress <- map["ipAddress"]
        ipSubnetMask <- map["ipSubnetMask"]
        model <- map["model"]
        locationId <- map["locationId"]
        status <- map["status"]
        type <- map["type"]
        serialNumber <- map["serialNumber"]
        version <- map["version"]
        communicationProtocols <- map["communicationProtocols"]
        targetMachines <- map["targetMachines"]
        location <- map["location"]
        serialNum <- map["serialNum"]
    }

}
