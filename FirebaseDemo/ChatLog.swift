//
//  ChatLog.swift
//  Pods
//
//  Created by Brandon Rich2 on 2/23/16.
//
//

import Foundation

class ChatLog {
    var messages: [Message] = []
    
    func removeMessageById(id: String ) {
        for (index, m) in messages.enumerate() {
            if m.id == id {
                messages.removeAtIndex(index)
            }
        }
    }
}