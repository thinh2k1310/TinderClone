//
//  MessageListViewModel.swift
//  TinderClone
//
//  Created by Truong Thinh on 17/01/2022.
//

import Foundation

class MessageListViewModel : ObservableObject{
    @Published var messagePreviews : [MessagePreview] = []
    
    init(){
        loadMessage()
    }
    
    func loadMessage(){
        messagePreviews = MessagePreview.examples
    }
}
