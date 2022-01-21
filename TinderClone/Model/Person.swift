//
//  Person.swift
//  TinderClone
//
//  Created by Truong Thinh on 17/01/2022.
//

import Foundation

struct Person : Hashable ,Identifiable{
    var id = UUID()
    var name : String
    var imageURLS : [URL]
    var bio : String
    var age : Int
}
extension Person{
    static let example = Person(name: "Thinh", imageURLS: [URL(string: "https://picsum.photos/400/300")!],bio: "This is my bio",age: 21)
    static let example1 = Person(name: "Nga", imageURLS: [URL(string: "https://picsum.photos/400/301")!],bio: "I really love dogs.",age: 25)
    static let examples : [Person] = [
        Person.example,Person.example1,
        Person(name: "Cuong",
               imageURLS: [URL(string: "https://picsum.photos/400/302")!],
               bio: "I love traveling",
               age: 12),
        Person(name: "Sang",
               imageURLS: [URL(string: "https://picsum.photos/400/303")!],
               bio: "I love smoking",
               age: 34),
        Person(name: "Dung",
               imageURLS: [URL(string: "https://picsum.photos/400/304")!],
               bio: "I love money",
               age: 32)
        
    ]
}
