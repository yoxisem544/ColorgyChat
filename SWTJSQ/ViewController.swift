//
//  ViewController.swift
//  SWTJSQ
//
//  Created by David on 2015/3/6.
//  Copyright (c) 2015年 David. All rights reserved.
//

import UIKit

class ViewController: JSQMessagesViewController {

    var messages: NSMutableArray!
    var incomingBubble: JSQMessagesBubbleImage!
    var outgoingBubble: JSQMessagesBubbleImage!
    var incomingAvatar: JSQMessagesAvatarImage!
    var outgoingAvatar: JSQMessagesAvatarImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.senderId = "user1"
        self.senderDisplayName = "David Lin"
        
        var bubble = JSQMessagesBubbleImageFactory()
        self.incomingBubble = bubble.incomingMessagesBubbleImageWithColor(UIColor.jsq_messageBubbleLightGrayColor())
        self.outgoingBubble = bubble.outgoingMessagesBubbleImageWithColor(UIColor.jsq_messageBubbleBlueColor())
        
        var avatar: JSQMessagesAvatarImageFactory!
        self.incomingAvatar = JSQMessagesAvatarImageFactory.avatarImageWithImage(UIImage(named: "1.png"), diameter: 64)
        self.outgoingAvatar = JSQMessagesAvatarImageFactory.avatarImageWithImage(UIImage(named: "2.png"), diameter: 64)
        
        self.messages = NSMutableArray()
        
        self.autoRecieveMessage()
    }
    
    override func didPressAccessoryButton(sender: UIButton!) {
        println("Hi acc!")
    }
    
    override func didPressSendButton(button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: NSDate!) {
        // set send sound
        JSQSystemSoundPlayer.jsq_playMessageSentSound()
        
//         這樣好像可以SETUP media item!!
//        var massage: JSQMessage = JSQMessage(senderId: <#String!#>, displayName: <#String!#>, media: <#JSQMessageMediaData!#>)
        // setup text message
//        var message: JSQMessage = JSQMessage(senderId: senderId, displayName: senderDisplayName, text: text)
        var media: JSQMessageMediaData = JSQPhotoMediaItem(image: UIImage(named: "1.png"))
        var message: JSQMessage = JSQMessage(senderId: senderId, displayName: senderDisplayName, media: media)
        self.messages.addObject(message)
        self.finishSendingMessage()
    }
    
    // set outgoing message
    override func collectionView(collectionView: JSQMessagesCollectionView!, messageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageData! {
        if self.messages[indexPath.item].isKindOfClass(JSQPhotoMediaItem) {
            println("jsqphotomediaitem")
        }
        return self.messages[indexPath.item] as JSQMessageData
    }
    
    // set bubble image
    override func collectionView(collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageBubbleImageDataSource! {
        var message: JSQMessage = self.messages[indexPath.item] as JSQMessage
        if message.senderId == self.senderId {
            return self.outgoingBubble
        }
        return self.incomingBubble
    }
    
    // set avatar image
    override func collectionView(collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageAvatarImageDataSource! {
        var message: JSQMessage = self.messages[indexPath.item] as JSQMessage
        if message.senderId == self.senderId {
            return self.outgoingAvatar
        }
        return self.incomingAvatar
    }
    
    // determine counts of message
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.messages.count
    }
    
    func autoRecieveMessage() {
        NSTimer.scheduledTimerWithTimeInterval(2.5, target: self, selector: "sendSomeMessage", userInfo: nil, repeats: true)
    }
    
    func sendSomeMessage() {
        var message: JSQMessage = JSQMessage(senderId: "user2", displayName: "I am user 2", text: "auto sent!")
        self.messages.addObject(message)
        self.finishReceivingMessage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

