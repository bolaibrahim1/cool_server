//
//  LoginViewController.swift
//  MobileNocTask
//
//  Created by Bola Ibrahim on 12/11/18.
//  Copyright © 2018 BolaIbrahim. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTxtField: UITextView!
    @IBOutlet weak var passwordTxtField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        ApiClient.login(userName: userNameTxtField.text!, password: passwordTxtField.text!) { (DataModel) in
            let contentVC = self.storyboard?.instantiateViewController(withIdentifier: "ContentVC") as! ContentViewController
            contentVC.contentArr = DataModel.content!
            self.present(contentVC, animated: true, completion: nil)

            
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
