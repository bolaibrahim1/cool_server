//
//  Global.swift
//  MobileNocTask
//
//  Created by Bola Ibrahim on 12/8/18.
//  Copyright © 2018 BolaIbrahim. All rights reserved.
//

import Foundation
import UIKit

class Global {
    
    // MARK: - Show Alert Message at any screen on the app

    static func showAlertMessage(title: String, Message msg: String) {
        var appdelegate : AppDelegate!
        if appdelegate == nil {
            appdelegate =  UIApplication.shared.delegate as? AppDelegate
        }
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        appdelegate.window?.topMostWindowController()?.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Show Indecator at any screen on the app

    class func ShowIndecator(_ type : String) -> Void {
        var  appdelegate : AppDelegate!
        if appdelegate == nil {
            appdelegate =  UIApplication.shared.delegate as? AppDelegate
        }
        if appdelegate.indecator == nil {
            appdelegate.indecator = UIActivityIndicatorView.init(frame: CGRect.init(x: (appdelegate.window!.frame.width / 2) - 30 , y: (appdelegate.window!.frame.height / 2 ) + 30   , width: 60, height: 60))
            appdelegate.indecator.style = UIActivityIndicatorView.Style.init(rawValue: 16)!
        }
        if type == "start" {
            appdelegate.window?.topMostWindowController()?.view.addSubview(appdelegate.indecator)
            appdelegate.indecator.startAnimating()
        } else if type == "stop"{
            appdelegate.indecator.stopAnimating()
        }
    }
}
