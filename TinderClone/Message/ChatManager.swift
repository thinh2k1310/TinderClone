//
//  ChatManager.swift
//  TinderClone
//
//  Created by Truong Thinh on 17/01/2022.
//

import Foundation
import Combine
import UIKit

class ChatManager : ObservableObject {
    @Published var messages : [Message] = []
    @Published var keyboardIsShowing : Bool = false
    private var person : Person
    var cancelable : AnyCancellable? = nil
    
    init(person : Person){
        self.person = person
        loadMessage()
        setupPublishers()
    }
     public func sendMessage(_ message : Message){
        //networking
        messages.append(message)
    }
    private let keyboardWillShow = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillShowNotification)
        .map({_ in true})
    private let keyboardWillHide = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillHideNotification)
        .map({_ in false})
    private func setupPublishers(){
        cancelable = Publishers.Merge(keyboardWillShow,keyboardWillHide)
            .subscribe(on: DispatchQueue.main)
            .assign(to: \.keyboardIsShowing, on: self)
    }
    
    private func loadMessage(){
        messages = [Message.exampleSent, Message.exampleReceived]
    }
    deinit{
        cancelable?.cancel()
    }
}
