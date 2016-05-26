//
//  homeViewController.swift
//  Firebase test2 Auth
//
//  Created by Johnny' mac on 2016/5/25.
//  Copyright © 2016年 Johnny' mac. All rights reserved.
//

import Firebase


class homeViewController: UIViewController {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBAction func tapDidLogOut(sender: AnyObject) {
    try!FIRAuth.auth()!.signOut()
        dispatch_async(dispatch_get_main_queue(), {()-> Void in
            let viewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Login")
            self.presentViewController(viewController, animated: true, completion: nil)
        })
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //顯現使用者名稱
        if let username = FIRAuth.auth()?.currentUser?.email{
    self.userNameLabel.text = "Hi!" + FIRAuth.auth()!.currentUser!.email!
        }
        
}
    
    
    override func viewWillAppear(animated: Bool) {
        if FIRAuth.auth()!.currentUser == nil{
            dispatch_async(dispatch_get_main_queue(), {() -> Void in
                let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Login")
                self.presentViewController(viewController, animated: true, completion: nil)
                
            })
            
        }
}
}
