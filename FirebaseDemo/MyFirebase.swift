//
//  MyFirebase.swift
//  FirebaseDemo
//
//  Created by Brandon Rich2 on 2/17/16.
//  Copyright © 2016 Infinite Donuts. All rights reserved.
//

import Foundation
import Firebase

class MyFirebase {
    private let firebaseURL = "https://swiftchat-cse40333.firebaseio.com/"
    var rootRef : Firebase
    
    static let sharedInstance = MyFirebase()
    
    private init() {
        rootRef = Firebase(url:firebaseURL)
    }
}