//
//  Person.swift
//  TinderClone
//
//  Created by Truong Thinh on 17/01/2022.
//

import SwiftUI

struct Person : Hashable ,Identifiable{
    var id = UUID()
    var name : String
    var imageURLS : [URL]
    var bio : String
    var age : Int
    var distance : Int
    var bioLong : String
    //Use for card manipulation
    var x : CGFloat = 0.0
    var y : CGFloat = 0.0
    var degree : Double = 0.0
}
extension Person{
    static let example = Person(name: "Thinh",
                                imageURLS: [URL(string: "https://picsum.photos/400/300")!,
                                            URL(string: "https://picsum.photos/400/301")!,
                                            URL(string: "https://picsum.photos/400/302")!,
                                            URL(string: "https://picsum.photos/400/303")!
                                           ],
                                bio: "This is my bio.I really love dogs.I really love dogs.I really love dogs.I really love dogs.I really love dogs.",age: 21, distance: 20, bioLong: "This is my bio.I really love dogs.I really love dogs.I really love dogs.I really love dogs.I really love dogs.")
    static let example1 = Person(name: "Nga", imageURLS: [URL(string: "https://picsum.photos/400/300")!,
                                                          URL(string: "https://picsum.photos/400/301")!,
                                                          URL(string: "https://picsum.photos/400/302")!,
                                                          URL(string: "https://picsum.photos/400/303")!
                                                         ],bio: "I really love dogs.",age: 25, distance: 12, bioLong: "This is my bio.I really love dogs.I really love dogs.I really love dogs.I really love dogs.I really love dogs.")
    static let examples : [Person] = [
        Person.example,Person.example1,
        Person(name: "Cuong",
               imageURLS: [URL(string: "https://picsum.photos/400/300")!,
                           URL(string: "https://picsum.photos/400/301")!,
                           URL(string: "https://picsum.photos/400/302")!,
                           URL(string: "https://picsum.photos/400/303")!
                          ],
               bio: "I love traveling",
               age: 12, distance: 5, bioLong: "This is my bio.I really love dogs.I really love dogs.I really love dogs.I really love dogs.I really love dogs."),
        Person(name: "Sang",
               imageURLS: [URL(string: "https://picsum.photos/400/304")!,
                           URL(string: "https://picsum.photos/400/305")!,
                           URL(string: "https://picsum.photos/400/306")!,
                           URL(string: "https://picsum.photos/400/307")!
                          ],
               bio: "I love smoking",
               age: 34, distance: 7, bioLong: "This is my bio.I really love dogs.I really love dogs.I really love dogs.I really love dogs.I really love dogs."),
        Person(name: "Dung",
               imageURLS: [URL(string: "https://picsum.photos/400/308")!,
                           URL(string: "https://picsum.photos/400/309")!,
                           URL(string: "https://picsum.photos/400/310")!,
                           URL(string: "https://picsum.photos/400/311")!
                          ],
               bio: "I love money",
               age: 32, distance: 17, bioLong: "This is my bio.I really love dogs.I really love dogs.I really love dogs.I really love dogs.I really love dogs.")
        
    ]
}
