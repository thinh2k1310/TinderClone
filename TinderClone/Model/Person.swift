//
//  Person.swift
//  TinderClone
//
//  Created by Truong Thinh on 17/01/2022.
//

import Foundation

struct Person : Hashable {
    var name : String
    var imageURLS : [URL]
    var bio : String
}
extension Person{
    static let example = Person(name: "Thinh", imageURLS: [URL(string: "https://picsum.photos/400/300")!],bio: "This is my bio")
    static let example1 = Person(name: "Nga", imageURLS: [URL(string: "https://picsum.photos/400/301")!],bio: "I really love dogs.")
}
