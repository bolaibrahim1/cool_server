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
    
    // MARK: - Login
    
    static func login(userName: String, password: String, completionHandler: @escaping ( _ data: DataModel) -> Void) {
        
        let credentialData = "\(userName):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers = ["Authorization": "Basic \(base64Credentials)"]
        
        UserDefaults.standard.set(base64Credentials, forKey: "CredentialToken")

        NetworkHelper.networkRequester(url: BackEndServant.get_ContentApi(), way: .get, headers: headers) { (result) in
            if let deserializedObject = Mapper<DataModel>().map(JSONObject: result) {
                completionHandler(deserializedObject)
            }
        }

    }
    
    // MARK: - Get Content 
    
    static func getData(page: Int, size: Int, completionHandler: @escaping ( _ data: DataModel) -> Void) {
        
        let credentialToken = UserDefaults.standard.value(forKey: "CredentialToken")
        let headers = ["Authorization" : "Basic \(String(describing: credentialToken))"]
        
        NetworkHelper.networkRequester(url: BackEndServant.get_ContentApi() + "?page=\(page)&size=\(size)", way: .get, headers: headers) { (result) in
            if let deserializedObject = Mapper<DataModel>().map(JSONObject: result) {
                completionHandler(deserializedObject)
            }
        }
    }

}
