//
//  ChatView.swift
//  TinderClone
//
//  Created by Truong Thinh on 17/01/2022.
//

import SwiftUI
import simd

struct ChatView: View {
    // MARK: - PROPERTIES
    @ObservedObject var chatMng : ChatManager
    private var person : Person
    init(person : Person){
        self.person = person
        self.chatMng = ChatManager(person: person)
    }
    @State private var typingMessage : String = ""
    @State private var scrollProxy : ScrollViewProxy? = nil
    // MARK: - FUNCTIONS
    func sendMessage(){
        chatMng.sendMessage(Message(content: typingMessage))
        typingMessage = ""
    }
    func scrollToBottom(){
        withAnimation{
            scrollProxy?.scrollTo(chatMng.messages.count-1, anchor: .bottom)
        }
    }
    // MARK: - BODY
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                Spacer()
                    .frame(height:70)
                    ScrollView(.vertical , showsIndicators: false){
                        ScrollViewReader { proxy in
                        LazyVStack{
                            ForEach(chatMng.messages.indices, id : \.self){ index in
                                let msg = chatMng.messages[index]
                                MessageView(message: msg)
                                    .id(index)
                            }
                        }
                        .onAppear(perform: {
                            scrollProxy = proxy
                        })
                        .onChange(of: chatMng.messages.count){ _ in
                            proxy.scrollTo(chatMng.messages.count-1)
                        }
                    }
                }
                ZStack {
                    //Color.textfieldBackground
                    HStack {
                        TextField("Type message here...",text: $typingMessage)
                            .padding()
                            .foregroundColor(.textPrimary)
                            .textFieldStyle(PlainTextFieldStyle())
                            .frame(height:45)
                            .padding(.trailing,20)
                            .background(Color.textfieldBackground)
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .strokeBorder(.gray.opacity(0.3),lineWidth: 1)
                                )
                            
                        
                        Button(action: {
                            sendMessage()
                            scrollToBottom()
                        }, label: {
                            Image(systemName: "paperplane.fill")
                                .foregroundColor(typingMessage.isEmpty ? .textPrimary : .accentColor)
                        })
                            .disabled(typingMessage.isEmpty)
                    }
                    
                }
                .frame(height:40)
                .cornerRadius(20)
                .padding(.horizontal)
                .padding(.bottom)
            }
            ChatViewHeader(name: person.name, imageURL: person.imageURLS.first, videoAction: { })
        }//:ZSTACK
        .navigationTitle("")
        .navigationBarHidden(true)
        .onChange(of: chatMng.keyboardIsShowing, perform: { value in
            if value{
                scrollToBottom()
            }
        })
        .onChange(of: chatMng.messages, perform: {_ in
            scrollToBottom()
        })
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(person: Person.example)
    }
}
