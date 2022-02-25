//
//  UserManager.swift
//  TinderClone
//
//  Created by Truong Thinh on 19/01/2022.
//

import Foundation

class UserManager : ObservableObject{
    @Published var currentUser : User = User(name: "", goldSubcriber: false, age : 0)
    @Published var matches : [Person] = []
    @Published var topPicks : [Person] = []
    @Published var cardPeople : [Person] = []
    init(){
        loadUsers()
        loadMatches()
        loadTopPicks()
        loadCardPeople()
    }
    func loadCardPeople(){
        cardPeople = Person.examples
    }
    func loadUsers(){
        currentUser = User.example
    }
    func loadMatches(){
        matches = Person.examples
    }
    func loadTopPicks(){
        topPicks = Person.examples.shuffled()
    }
    public func swipe(_ person : Person,_ direction : SwipeDirection){
        cardPeople.removeLast()
    }
    public func supperLike(_ person : Person){
        cardPeople.removeLast()
    }
    enum SwipeDirection{
        case no
        case like
    }
}
