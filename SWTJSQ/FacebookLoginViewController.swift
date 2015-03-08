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
    @IBOutlet var profilePhoto: FBProfilePictureView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("view did load")
        
        var loginView = FBLoginView()
        loginView.center = self.view.center
        self.view.addSubview(loginView)
        
        loginView.delegate = self
        
        var completionHandle = {connection, result, error in} as FBRequestHandler
        
    }
    
    func loginViewFetchedUserInfo(loginView: FBLoginView!, user: FBGraphUser!) {
        self.profilePhoto.profileID = user.objectID
        
        println("/\(self.profilePhoto.profileID)/?fields=feed.limit=(1)")
        
        FBRequestConnection.startWithGraphPath("/\(self.profilePhoto.profileID)/?fields=feed.limit=(1)", completionHandler: { (connection: FBRequestConnection!, result: AnyObject!, error: NSError!) -> Void in
            if (result? != nil) {
                println(connection)
                println("yeah")
            } else {
                println("nono")
            }
        })
    }
}
