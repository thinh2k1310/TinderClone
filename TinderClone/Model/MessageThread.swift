//
//  MessageThread.swift
//  TinderClone
//
//  Created by Truong Thinh on 17/01/2022.
//

import Foundation

struct MessagePreview : Hashable{
    var person : Person
    var lastMessage : String
}

extension MessagePreview{
    static let example = MessagePreview(person: Person.example, lastMessage: "Hello there.How are you today? How is the weather there right now?")
    static let examples : [MessagePreview] = [
        MessagePreview(person: Person.example, lastMessage: "Hello there.How are you today? How is the weather there right now?"),
        MessagePreview(person: Person.example1, lastMessage: "Hi there.Are you free tonight?")
        
    ]
    
}
