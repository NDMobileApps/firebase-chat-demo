//
//  Message.swift
//  FirebaseDemo
//
//  Created by Brandon Rich2 on 2/17/16.
//  Copyright © 2016 Infinite Donuts. All rights reserved.
//

import Foundation

class Message : CustomStringConvertible {
    var id: String = ""
    var sender: String = ""
    var text: String = ""
    
    var description: String {
        return "\(sender): \(text)"
    }
}