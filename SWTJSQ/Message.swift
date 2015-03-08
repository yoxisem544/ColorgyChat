//
//  Message.swift
//  
//
//  Created by David on 2015/3/8.
//
//

import Foundation

class Message: NSObject {
    var text_: String
    var senderId_: String
    var senderDisplayName_: String
    var avatarImageUrl_: String
    var isMediaMessage_: String
    var mediaDataUrl_: String
    
    init(isMediaMessage: String?, text: String?, senderId: String?, senderDisplayName: String?, avatarImageUrl: String?, mediaDataUrl: String?) {
        self.text_ = text!
        self.senderId_ = senderId!
        self.senderDisplayName_ = senderDisplayName!
        self.isMediaMessage_ = isMediaMessage!
        self.avatarImageUrl_ = avatarImageUrl!
        self.mediaDataUrl_ = mediaDataUrl!
    }
    
    func text() -> String! {
        return text_
    }
    
    func senderId() -> String! {
        return senderId_
    }
    
    func senderDisplayName() -> String! {
        return senderDisplayName_
    }
    
    func isMediaMessage() -> String! {
        return isMediaMessage_
    }
    
    func avatarImageUrl() -> String! {
        return avatarImageUrl_
    }
    
    func mediaDataUrl() -> String! {
        return mediaDataUrl_
    }
    
}
