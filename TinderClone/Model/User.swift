//
//  User.swift
//  TinderClone
//
//  Created by Truong Thinh on 19/01/2022.
//

import Foundation

struct User{
    var name : String
    var goldSubcriber : Bool
    var imageURLS : [URL] = []
    var jobTitle : String = ""
    var age : Int
    var profileTip : String = ""
}
extension User{
    static let example = User(name: "Thinh",
                              goldSubcriber: false,
                              imageURLS: [URL(string: "https://picsum.photos/400/300")!],
                              jobTitle : "iOS Developer",
                              age: 21)
}
