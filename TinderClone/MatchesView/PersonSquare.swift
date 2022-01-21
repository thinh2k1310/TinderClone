//
//  PersonSquare.swift
//  TinderClone
//
//  Created by Truong Thinh on 19/01/2022.
//

import SwiftUI
import Kingfisher

struct PersonSquare: View {
    // MARK: - PROPERTIES
    var person : Person
    var blur : Bool
    // MARK: - BODY
    var body: some View {
        GeometryReader { geo in
            ZStack (alignment: .bottomLeading){
                KFImage(person.imageURLS.first)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width : geo.size.width ,height : geo.size.height)
                    .if(blur){
                        $0.blur(radius: 20)
                    }
                Text("\(person.name),\(person.age)")
                    .padding(.horizontal)
                    .foregroundColor(.white)
                    .font(.system(size: 20,weight: .bold))
                    .offset(y : -10)
                    .if(blur){
                        $0.redacted(reason: .placeholder)
                    }
            }
            .cornerRadius(20)
        }
        
    }
}

struct PersonSquare_Previews: PreviewProvider {
    static var previews: some View {
        PersonSquare(person: Person.example,blur: true)
            
    }
}
