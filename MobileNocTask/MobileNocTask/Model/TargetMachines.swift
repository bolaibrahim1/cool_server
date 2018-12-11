
import Foundation
import ObjectMapper

struct TargetMachines : Mappable {
	var id : Int?
	var sourceMachineId : Int?
	var targetMachine : TargetMachine?
	var circuitStatusId : Int?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		id <- map["id"]
		sourceMachineId <- map["sourceMachineId"]
		targetMachine <- map["targetMachine"]
		circuitStatusId <- map["circuitStatusId"]
	}

}
