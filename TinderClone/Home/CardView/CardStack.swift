//
//  CardStack.swift
//  TinderClone
//
//  Created by Truong Thinh on 07/02/2022.
//

import SwiftUI

struct CardStack: View {
    var people : [Person]
    @State private var isFullScreen : Bool = false
    let screen = UIScreen.main.bounds
    var body: some View {
        ZStack {
 
            ForEach(people){ person in
                CardView(person: person, fullscreenMode: $isFullScreen)
            }
        }
        .frame(width: screen.width, height: isFullScreen ? screen.height : screen.height*0.7)
    }
}

struct CardStack_Previews: PreviewProvider {
    static var previews: some View {
        CardStack(people: Person.examples)
            .environmentObject(UserManager())
    }
}
