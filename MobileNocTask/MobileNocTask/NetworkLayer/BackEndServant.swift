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
