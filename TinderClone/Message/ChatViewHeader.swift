//
//  ChatViewHeader.swift
//  TinderClone
//
//  Created by Truong Thinh on 17/01/2022.
//

import SwiftUI

struct ChatViewHeader: View {
    // MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    let name : String
    let imageURL : URL?
    let videoAction : () -> Void
    // MARK: - BODY
    
    var body: some View {
        ZStack{
            Color.white
                .edgesIgnoringSafeArea(.all)
                .shadow(radius: 6)
            HStack{
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color.textPrimary)
                        .font(.system(size:20,weight: .semibold ))
                })
                Spacer()
                VStack(spacing : 6){
                    RoundedImage(url: imageURL)
                        .frame(height : 50)
                    Text(name)
                        .foregroundColor(.textSecondary)
                        .font(.system(size: 14))
                }
                Spacer()
                Button(action: {
                    videoAction()
                }, label: {
                    Image(systemName: "video.fill")
                        .font(.system(size:20,weight: .bold ))
                })
            }//:HSTACK
            .padding()
        }//:ZSTACK
        .frame(height : 50)
    }
}

struct ChatViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        let person : Person = Person.example
        ChatViewHeader(name: person.name,
                       imageURL: person.imageURLS.first,
                       videoAction: {
            //
        }
        )
    }
}
