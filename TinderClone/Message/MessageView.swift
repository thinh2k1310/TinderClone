//
//  MessageView.swift
//  TinderClone
//
//  Created by Truong Thinh on 17/01/2022.
//

import SwiftUI

struct MessageView: View {
    // MARK: - PROPERTIES
    var message : Message
    
    // MARK: - BODY
    
    var body: some View {
        HStack {
            if message.fromCurrentUser{
                Spacer()
            }
            Text(message.content)
                .foregroundColor(.white)
                .padding(10)
                .background(message.fromCurrentUser ? Color.blue : Color.gray)
                .cornerRadius(12)
            if !message.fromCurrentUser{
                Spacer()
            }
        }//:HSTACK
        .padding()
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: Message.exampleSent)
    }
}
