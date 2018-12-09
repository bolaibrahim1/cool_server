//
//  NetworkHelper.swift
//  MobileNocTask
//
//  Created by Bola Ibrahim on 12/8/18.
//  Copyright © 2018 BolaIbrahim. All rights reserved.
//

import Foundation
import Alamofire

class NetworkHelper {
    
    static func networkRequester(parameter: [String:Any]! = nil, url: String, way: HTTPMethod, completionHandler: @escaping ( _ result: AnyObject) -> Void) -> Void {
        
        if AppDelegate().isConnectedToNetwork() == true {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            Global.ShowIndecator("start")
            let headers = ["Authorization":"Basic YWRtaW5AYm9vdC5jb206YWRtaW4="]
            
            SecurityCertificateManager.sharedInstance.defaultManager.request(url, method: way, parameters: parameter as [String : AnyObject]?, encoding: JSONEncoding.default, headers: headers).responseJSON {
                (response) in
                switch response.result {
                case .success(_):
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    Global.ShowIndecator("stop")
                    if let result = response.result.value {
                        print(result)
                        completionHandler(result as AnyObject)
                    }
                case .failure(_):
                    self.failGetData()
                }
                
            }
        } else {
            failGetData()
        }
    }
    
    static func failGetData() -> Void {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        Global.ShowIndecator("stop")
        Global.showAlertMessage(title: "Request Failure", Message: "Please make sure of the following :\n  1-You have good net connection. \n 2-Server Error.\n Or try again later")
    }
    
}

class SecurityCertificateManager {
    static let sharedInstance = SecurityCertificateManager()
    
    let defaultManager: Alamofire.SessionManager = {
        let serverTrustPolicies: [String: ServerTrustPolicy] = [
            "45.55.43.15": .disableEvaluation
        ]
        
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        
        return Alamofire.SessionManager(
            configuration: configuration,
            serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
        )
    }()
}
