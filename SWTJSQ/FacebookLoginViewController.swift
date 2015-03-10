//
//  FacebookLoginViewController.swift
//  SWTJSQ
//
//  Created by David on 2015/3/7.
//  Copyright (c) 2015年 David. All rights reserved.
//

import UIKit

class FacebookLoginViewController: UIViewController, FBLoginViewDelegate {
    
    var hi: FBProfilePictureView!
    var userId: NSString!
    
    @IBOutlet var profilePhoto: FBProfilePictureView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("view did load")
        
        FBSession.activeSession().closeAndClearTokenInformation()
        
        var loginView = FBLoginView()
        loginView.center = self.view.center
        loginView.delegate = self
        self.view.addSubview(loginView)
    }
    
    func loginViewFetchedUserInfo(loginView: FBLoginView!, user: FBGraphUser!) {
        self.profilePhoto.profileID = user.objectID
        
//        println("/\(self.profilePhoto.profileID)/?fields=feed.limit=(1)")
        
        if user.objectID != "" {
            println("push~")
            self.performSegueWithIdentifier("loginSegue", sender: self)
        }
        
        FBRequestConnection.startWithGraphPath("/\(self.profilePhoto.profileID)/?fields=feed.limit=(1)", completionHandler: { (connection: FBRequestConnection!, result: AnyObject!, error: NSError!) -> Void in
            if (result? != nil) {
//                println(connection)
                println("yeah")
                
            } else {
                println("nono")
            }
        })
    }
    
    func loginViewShowingLoggedInUser(loginView: FBLoginView!) {
        println("HIHI")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "loginSegue" {
            println("OK pus login")
            var vc: ViewController = segue.destinationViewController as ViewController
            vc.performLogin(self.profilePhoto.profileID)
            println(self.profilePhoto.profileID)
        }
    }
    
}
