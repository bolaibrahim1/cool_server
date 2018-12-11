//
//  BackEndServant.swift
//  MobileNocTask
//
//  Created by Bola Ibrahim on 12/8/18.
//  Copyright © 2018 BolaIbrahim. All rights reserved.
//

import Foundation

class BackEndServant {
    
    // MARK: - Domain
    static var domainUrl  = "https://45.55.43.15:9090/"
    static var baseURL = "api/"
    
    
    // MARK: - Get Content
    
    class func get_ContentApi() -> String {
        let serviceName = "machine"
        let serviceURL = "\(domainUrl)\(baseURL)\(serviceName)"
        return serviceURL
    }
}

//        let userName = "admin@boot.com"  //userNameTxtField.text
//        let passwords = "admin" //passwordTxtField.text
//       // let loginString = String(format: "%@%@", userName, password)
//       // let loginData = loginString.data(using: String.Encoding.utf8)
//        //let base64LoginString = loginData?.base64EncodedString()
//
//        // create the request
//        let url = URL(string: "https://45.55.43.15:9090/api/machine/?page=\(1)&size=\(5)")!
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        //request.setValue("Basic \(String(describing: base64LoginString))", forHTTPHeaderField: "Authorization")
//
////        let urlConnection = NSURLConnection(request: request, delegate: self)
//
////        NSURLConnection.sendAsynchronousRequest(request, queue: OperationQueue.main) { (response, data, error) in
////            print(response!)
////        }
//
////        SecurityCertificateManager.sharedInstance.defaultManager.request(request).responseJSON { (response) in
//////            print(response)
////            if let deserializedObject = Mapper<DataModel>().map(JSONObject: response.result.value) {
////                print(deserializedObject)
////            }
////
////        }
//
//        let user = userName
//        let password = passwords
//        let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
//        let base64Credentials = credentialData.base64EncodedString(options: [])
//        let headers = ["Authorization": "Basic \(base64Credentials)"]
//
//        SecurityCertificateManager.sharedInstance.defaultManager.request(url,
//                          method: .get,
//                          parameters: nil,
//                          encoding: URLEncoding.default,
//                          headers:headers)
//            .validate()
//            .responseJSON { response in
//                if response.result.value != nil{
//                    print(response)
//                    if let deserializedObject = Mapper<DataModel>().map(JSONObject: response.result.value) {
//                        print(deserializedObject)
//                    }
//
//                }else{
//                  print(response.error)
//                }
//        }

