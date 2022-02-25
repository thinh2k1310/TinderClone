//
//  CardView.swift
//  TinderClone
//
//  Created by Truong Thinh on 22/01/2022.
//

import SwiftUI

struct CardView: View {
    // MARK: - PROPERTIES
    @State var person : Person
    @Binding var fullscreenMode : Bool
    let screenCutoff = (UIScreen.main.bounds.width / 2) * 0.8
    
    // MARK: - BODY
    var body: some View {
        GeometryReader{ geo in
            if fullscreenMode{
                FullScreenCardView(person: person, fullScreenMode: $fullscreenMode)
            }
            else{
                CardImageScroller(person: person, fullscreenMode: $fullscreenMode)
                    .animation(.easeOut(duration: 0.2))
                    .frame(width: geo.size.width-20,height : geo.size.height)
                    .padding(.leading,10)
                    .offset(x : person.x, y : person.y)
                    .rotationEffect(.degrees(person.degree))
                    .gesture(
                        DragGesture()
                            .onChanged({ value in
                                withAnimation(.default){
                                    person.x = value.translation.width
                                    person.y = value.translation.height
                                }
                                withAnimation{
                                    person.degree =  Double((value.translation.width / 25) * -1)
                                }
                            })
                            .onEnded({ value in
                                withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 50, damping: 10, initialVelocity: 0)){
                                    let width = value.translation.width
                                    
                                    if width >= 0 && width <= screenCutoff{
                                        //snap back to middle
                                        person.x = 0
                                        person.y = 0
                                        person.degree = 0
                                    }
                                    else if width <= -1 && width >= -screenCutoff{
                                        person.x = 0
                                        person.y = 0
                                        person.degree = 0
                                    }
                                    else if width > screenCutoff{
                                        //swipe right
                                        person.x = 500
                                        person.degree = 12
                                    }
                                    else if width < -screenCutoff{
                                        //swipe left
                                        person.x = -500
                                        person.degree = -12
                                    }
                                    
                                    
                                }
                            })
                    )
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(person: Person.example, fullscreenMode: .constant(true))
        CardView(person: Person.example, fullscreenMode: .constant(false))
        
    }
}
