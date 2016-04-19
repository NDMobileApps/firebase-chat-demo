//
//  ViewController.swift
//  FirebaseDemo
//
//  Created by Brandon Rich on 2/17/16.
//  Copyright © 2016 Infinite Donuts. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITableViewDataSource {

    var chatlog = ChatLog()
    private let firebaseURL = "YOUR_FIREBASE_URL_HERE"
    var rootRef : Firebase = Firebase()
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootRef = Firebase(url:firebaseURL)
        rootRef.observeEventType(.ChildAdded) { self.addMessage($0) }
        //rootRef.observeEventType(.ChildChanged ) { self.addMessage($0) }
        rootRef.observeEventType(.ChildRemoved ) { self.removeMessage($0) }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func addMessage(snapshot: FDataSnapshot ) {
                    print("Child Added")
        let m = Message()
        m.sender = snapshot.value["name"] as! String
        m.text = snapshot.value["text"] as! String
        m.id = snapshot.key
        self.chatlog.messages.append(m)
        self.tableView.reloadData()
    }
    
    func removeMessage( snapshot: FDataSnapshot ) {
        self.chatlog.removeMessageById(snapshot.key)
        self.tableView.reloadData()
    }

    @IBAction func sendMessage(sender: AnyObject) {
        
            var name = usernameTextField.text!
            let msg = messageTextField.text!
        if name.characters.count == 0 {
            name = "Anonymous User"
        }
        rootRef.childByAutoId().setValue([ "name": name, "text": msg])
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatlog.messages.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("messageCell", forIndexPath: indexPath)
        cell.textLabel?.text = chatlog.messages[indexPath.row].description
        return cell
    }


}

