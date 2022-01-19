//
//  Message.swift
//  TinderClone
//
//  Created by Truong Thinh on 17/01/2022.
//

import Foundation

struct Message : Hashable {
    
    var content : String
    var person : Person? = nil
    
    var fromCurrentUser : Bool {
        return person == nil
    }
}

extension Message{
    static let exampleSent = Message(content: "Hi there.")
    static let exampleReceived = Message(content: "Hello, How are you?", person: Person.example)
}
