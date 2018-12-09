//
//  ApiClient.swift
//  MobileNocTask
//
//  Created by Bola Ibrahim on 12/8/18.
//  Copyright © 2018 BolaIbrahim. All rights reserved.
//

import Foundation
import ObjectMapper

class ApiClient: NSObject {
    
    private override init () { }
    static let shared = ApiClient()
    
    
    // MARK: - Get Data from Api
    
    static func getData(page: Int, size: Int, completionHandler: @escaping ( _ data: DataModel) -> Void) {
        
        NetworkHelper.networkRequester(url: BackEndServant.get_ContentApi() + "?page=\(page)&size=\(size)", way: .get) { (result) in
            if let deserializedObject = Mapper<DataModel>().map(JSONObject: result) {
                completionHandler(deserializedObject)
            }
        }
    }
}
