//
//  MessageListView.swift
//  TinderClone
//
//  Created by Truong Thinh on 17/01/2022.
//

import SwiftUI

struct MessageListView: View {
    // MARK: - PROPERTIES
    @ObservedObject var vm : MessageListViewModel = MessageListViewModel()
    @State private var searchText : String = ""
    @State private var isEditing : Bool = false
    // MARK: - FUNCTION
    func displayPreview(_ preview : MessagePreview) -> Bool{
        if preview.person.name.contains(searchText){
            return true
        }
        if preview.lastMessage.contains(searchText){
            return true
        }
        if preview.person.bio.contains(searchText){
            return true
        }
        return false
    }
    
    // MARK: - BODY
    var body: some View {
        VStack {
            HStack {
                TextField("Search matches",text: $searchText)
                    .textCase(.lowercase)
                    .padding(.top,7)
                    .padding(.horizontal , 30)
                    .background(Color.textfieldBackground)
                    .cornerRadius(8)
                    .overlay(
                        HStack{
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.textPrimary)
                                .font(.system(size:20,weight: .bold))
                                .padding(.leading,5)
                            Spacer()
                            
                        }
                    )
                    .onTapGesture {
                        self.isEditing = true
                            }
                    .animation(.easeIn(duration: 0.25))
                .padding(.horizontal,10)
                if isEditing{ Button(action: {
                    isEditing = false
                    searchText = ""
                    endEditing(true)
                }, label: {
                    Text("Cancel")
                })
                .padding(.trailing,7)
                .transition(.move(edge: .trailing))
                .animation(.easeIn(duration: 0.25))
               }
            }
            Spacer()
                .frame(height : 15)
            ZStack {
                ScrollView(.vertical,showsIndicators: false) {
                    VStack{
                        ForEach(vm.messagePreviews.filter({searchText.isEmpty ? true : displayPreview($0)}) , id : \.self){ preview in
                            NavigationLink(destination : ChatView(person: preview.person),label: {
                                MessageRowView(preview: preview)
                            })
                                .buttonStyle(PlainButtonStyle())
                                .transition(.slide)
                                .animation(.easeIn(duration: 0.25))
                        }
                    }
                }
                if isEditing && searchText.isEmpty{
                    Color.white.opacity(0.5)
                }
            }
            Spacer()
            
        }
        .navigationBarHidden(true)
    }
}

struct MessageListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MessageListView()
        }
    }
}
